import pandas as pd


def download_titanic_data(save_path="titanic.csv"):
    """
    Downloads the Titanic dataset from a public GitHub repository
    and saves it locally as a CSV file.

    Parameters:
    - save_path (str): Path where the CSV will be saved.

    Returns:
    - pandas.DataFrame: The loaded Titanic DataFrame.
    """
    url = (
        "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
    )
    df = pd.read_csv(url)
    df.to_csv(save_path, index=False)
    print(f"Titanic dataset downloaded and saved to: {save_path}")
    return df


if __name__ == "__main__":
    titanic_df = download_titanic_data("data/titanic.csv")
    print(titanic_df.head())
