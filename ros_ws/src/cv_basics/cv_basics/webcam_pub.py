import rclpy
from rclpy.node import Node
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import time
 
class ImagePublisher(Node):
  def __init__(self):
    super().__init__('image_publisher')
      
    self.publisher_ = self.create_publisher(Image, 'video_frames', 10)

    timer_period = 0.01
      
    self.timer = self.create_timer(timer_period, self.timer_callback)

    self.cap = cv2.VideoCapture(0)

    self.br = CvBridge()
   
  def timer_callback(self):
    ret, frame = self.cap.read()
          
    if ret == True:
      self.publisher_.publish(self.br.cv2_to_imgmsg(frame))

    self.get_logger().info('Publishing video frame')
  
def main(args=None):
  rclpy.init(args=args)
  
  image_publisher = ImagePublisher()
  
  start = time.perf_counter()
  for i in range(20):
    rclpy.spin_once(image_publisher)
  end = time.perf_counter()
  
  print("Total Time: " + str(start-end))

  image_publisher.destroy_node()

  rclpy.shutdown()
  
if __name__ == '__main__':
  main()
