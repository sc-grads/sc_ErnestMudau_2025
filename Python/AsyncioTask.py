import asyncio
from datetime import datetime


async def fetch_data(input_data: int) -> dict:
    """Simulate an async data fetch with delay"""
    print(f'[{datetime.now():%H:%M:%S}] Starting fetch for {input_data}')
    start_time = datetime.now()

    await asyncio.sleep(3)  # Simulate I/O operation

    end_time = datetime.now()
    print(f'[{end_time:%H:%M:%S}] Finished fetch for {input_data}')

    return {
        'input': input_data,
        'start_time': f'{start_time:%H:%M:%S}',
        'end_time': f'{end_time:%H:%M:%S}',
        'duration': (end_time - start_time).total_seconds()
    }


async def main() -> None:
    # Run multiple fetches concurrently
    tasks = [
        fetch_data(123),
        fetch_data(456),
        fetch_data(789)
    ]

    results = await asyncio.gather(*tasks)

    print("\nResults:")
    for result in results:
        print(f"• Input {result['input']}: "
              f"{result['start_time']} → {result['end_time']} "
              f"({result['duration']:.2f}s)")


if __name__ == '__main__':
    asyncio.run(main())