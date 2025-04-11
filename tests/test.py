from semaphoreflask import app
import unittest

class TaskTest(unittest.TestCase):

    def test_homepage(self):
        tester = app.test_client(self)
        response = tester.get('/', content_type='html/text')
        self.assertEqual(response.status_code, 200)
        response = tester.get('/task/all', content_type='html/text')
        self.assertEqual(response.status_code, 200)

    def setUp(self):
        app.config['TESTING'] = True
        app.config['MONGO_URI'] = 'mongodb://localhost:27017/test_db'  # Test DB
        self.client = app.test_client()
 
        
if __name__ == '__main__':
    unittest.main()