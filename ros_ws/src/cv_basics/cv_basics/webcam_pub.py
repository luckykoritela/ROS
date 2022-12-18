import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import time
import psutil
import os
import tracemalloc
 
class ImgPublisher(Node):
  """
  Create an ImagePublisher class, which is a subclass of the Node class.
  """
  def __init__(self):
    """
    Class constructor to set up the node
    """
    super().__init__('image_publisher')
      
    self.publisher_ = self.create_publisher(Image, 'video_frames', 10)
      
    timer_period = 0.01
      
    self.timer = self.create_timer(timer_period, self.timer_callback)
         
    self.cap = cv2.VideoCapture(0)
         
    self.br = CvBridge()
   
  def timer_callback(self):
    """
    Callback function.
    This function gets called every 0.1 seconds.
    """
    ret, frame = self.cap.read()
          
    if ret == True:
      self.publisher_.publish(self.br.cv2_to_imgmsg(frame))
 
    # Display the message on the console
    self.get_logger().info('Publishing video frame')
  
def main(args=None):

  #tracemalloc.start()
  
  # Initialize the rclpy library
  rclpy.init(args=args)
  
  # Create the node
  image_publisher = ImgPublisher()
  
  # Spin the node so the callback function is called.
  print('pid = ', os.getpid())
  start = time.perf_counter()
  for i in range(500):
  	tracemalloc.start()
  	rclpy.spin_once(image_publisher)
  	print('RAM memory % used: ', psutil.virtual_memory()[2])
  	print('RAM Used (GB): ', psutil.virtual_memory()[3]/1000000000)
  	print(tracemalloc.get_traced_memory())
  	tracemalloc.stop()
  end = time.perf_counter()
  
  print("Total Time: " + str(end-start))
  
  #snapshot = tracemalloc.take_snapshot()
  #top_stats = snapshot.statistics('lineno')
  
  #print("[ Top 10 ]")
  #for stat in top_stats[:10]:
  #	print(stat)
  
  # Destroy the node
  image_publisher.destroy_node()
  
  # Shutdown the ROS client library for Python
  rclpy.shutdown()
  
if __name__ == '__main__':
  main()
