module UsersHelper
  def connect_user(online)
    online ? 'inline-block w-4 h-4 mr-2 bg-green-400 rounded-full' : 'inline-block w-4 h-4 mr-2 bg-gray-400 rounded-full' # Use 'bg-gray-400' for offline status, not 'bg-current'
  end
end
