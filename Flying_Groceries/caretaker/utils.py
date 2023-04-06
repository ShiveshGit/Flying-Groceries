import matplotlib.pyplot as plt
import base64
from io import BytesIO


def get_graph():
    buffer = BytesIO()
    # Saving the plot as png
    plt.savefig(buffer, format="png")
    # Setting cursor to beginning of stream
    buffer.seek(0)
    image_png = buffer.getvalue()
    # Setting base64 encode
    graph = base64.b64encode(image_png)
    # Decoding the string from base64 to UTF-8
    graph = graph.decode("utf-8")
    buffer.close()
    return graph


def get_plot(x, y, z):
    plt.switch_backend("AGG")
    plt.figure(figsize=(9, 5))
    plt.title("Popularity of Products Distribution")
    plt.plot(x, y)
    plt.xticks(rotation=60)
    plt.xticks(fontsize=8)
    if z == 0:
        plt.xlabel("(CategoryId,SubCategoryId,ProductId) --------------> ")
        plt.ylabel("Number of Customers ------------>")
    else:
        plt.xlabel("Date of Ordering --------------> ")
        plt.ylabel("Number of Orders ------------>")
    plt.tight_layout()
    graph = get_graph()
    return graph
