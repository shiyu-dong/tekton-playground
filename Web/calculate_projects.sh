for project in service1 service2; do
echo $project
# todo: start child
PROJECT=project BUILD_IMAGE=test_image ./task1.sh
PROJECT=project BUILD_IMAGE=test_image ./task2.sh
done
