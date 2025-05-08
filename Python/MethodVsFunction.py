class Connection:
    # This is a METHOD - it belongs to the class and takes 'self' as first parameter
    def __init__(self, connection_type: str) -> None:
        """Initialize a Connection instance with a specific type"""
        self.connection_type = connection_type

    # This is a METHOD - operates on class instances (has 'self')
    def connect(self) -> None:
        """Connect using the instance's connection type"""
        print(f'Connecting to: {self.connection_type}')

# This is a FUNCTION - exists outside any class (no 'self' parameter)
def connect(connection_type: str) -> None:
    """Standalone function to connect (not tied to any class instance)"""
    print(f'Connecting to: {connection_type}')