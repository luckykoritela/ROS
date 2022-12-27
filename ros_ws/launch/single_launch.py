from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
	return LaunchDescription([
		Node(
			package='cv_basics',
			executable='image_subscriber',
			name='sub',
			output='screen'
		),
		Node(
			package='cv_basics',
			namespace='publisher',
			executable='image_publisher',
			name='pub1',
			output='screen'
		)
	])
