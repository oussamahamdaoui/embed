from sentence_transformers import SentenceTransformer
import falcon
model = SentenceTransformer('thenlper/gte-large')

class Embeddings:
    def on_post(self, req, resp):
        sentences = req.media.get("sentences")
        resp.media =  model.encode(sentences).tolist()


app = falcon.App()
app.add_route('/embeddings', Embeddings())