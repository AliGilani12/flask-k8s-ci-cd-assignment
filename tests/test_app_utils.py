from app_utils import add_numbers


def test_add_numbers():
    """Test that add_numbers returns the expected sum."""
    assert add_numbers(2, 3) == 5
    assert add_numbers(-1, 1) == 0
