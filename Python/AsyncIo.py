

import asyncio
from asyncio import Task
from datetime import datetime


async def fetch_data(input_data: int) -> dict:
    print('Fetching data...')
    start_time: datetime = datetime.now()
    await asyncio.sleep(3)
    end_time: datetime = datetime.now()
    print('Data retrieved!')

    return {
        'input': input_data,
        'start_time': f'{start_time:%H:%M}',
        'end_time': f'{end_time:%H:%M}'
    }


async def main() -> None:
    data = await fetch_data(123)
    print(f"Received data: {data}")


if __name__ == '__main__':
    asyncio.run(main())
