from google.cloud import storage
import joblib

def upload_csv_file(obj, bucket_name, bucket_folder, file_name):
    
    # Save locally
    obj.to_csv(file_name, index=False)
    
    # Upload to GCS bucket
    client = storage.Client()
    bucket = client.bucket(bucket_name)
    
    blob_name = bucket_folder + '/' +  file_name
    blob = bucket.blob(blob_name)
    blob.upload_from_filename(file_name)
    print('File uploaded to {}'.format('gs://' + bucket_name + '/' + blob.name))

    

def upload_serialized_file(obj, bucket_name, bucket_folder, file_name):
    
    # Save locally
    joblib.dump(
        obj,
        file_name
    )
    
    # Upload to GCS bucket
    client = storage.Client()
    bucket = client.bucket(bucket_name)
    
    blob_name = bucket_folder + '/' +  file_name
    blob = bucket.blob(blob_name)
    blob.upload_from_filename(file_name)
    print('File uploaded to {}'.format('gs://' + bucket_name + '/' + blob.name))
    
    
    
    
def download_file(bucket_name, bucket_folder, file_name, pickle=False):
    client = storage.Client()
    bucket = client.bucket(bucket_name)
    
    blob_name = bucket_folder + '/' + file_name
    blob = bucket.get_blob(blob_name)
    if pickle is False:
        file = blob.download_to_filename(file_name)
    else:
        file = blob.download_as_string()
    return file