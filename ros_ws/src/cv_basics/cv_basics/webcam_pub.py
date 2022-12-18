import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import time
import psutil
import os
import tracemalloc
 
class ImgSubscriber(Node):
  """
  Create an ImageSubscriber class, which is a subclass of the Node class.
  """
  def __init__(self):
    """
    Class constructor to set up the node
    """
    super().__init__('image_subscriber')
      
    self.subscription = self.create_subscription(
      Image, 
      'video_frames', 
      self.listener_callback, 
      10)
    self.subscription
      
    self.br = CvBridge()
    
   
  def listener_callback(self, data):
    start = time.perf_counter()
    tracemalloc.start()
    
    face_cascade = cv2.CascadeClassifier('/home/luckykoritela/ros_ws/src/cv_basics/cv_basics/haarcascade_frontalface_default.xml')
    """
    Callback function.
    """
    self.get_logger().info('Receiving video frame')
 
    current_frame = self.br.imgmsg_to_cv2(data)
    
    image_gray = cv2.cvtColor(current_frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(image_gray)
    print(f"{len(faces)} faces detected in the image.")
    
    # Display image
    #for (x,y,w,h) in faces:
    #	cv2.rectangle(current_frame, (x,y), (x+w,y+h), (0,255,0), 2)
    #cv2.imshow("camera", current_frame)
    
    cv2.waitKey(1)
    
    print('RAM memory % used: ', psutil.virtual_memory()[2])
    print('RAM Used (GB): ', psutil.virtual_memory()[3]/1000000000)
    print(tracemalloc.get_traced_memory())
    tracemalloc.stop()
  
    end = time.perf_counter()
    print("Operation Time: " + str(end-start))
  
def main(args=None):
  
  # Initialize the rclpy library
  rclpy.init(args=args)
  
  # Create the node
  image_subscriber = ImgSubscriber()
  
  # Spin the node so the callback function is called.
  rclpy.spin(image_subscriber)
  
  # Destroy the node
  image_subscriber.destroy_node()
  
  # Shutdown the ROS client library for Python
  rclpy.shutdown()
  
if __name__ == '__main__':
  main()
