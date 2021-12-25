package com.ruoyi.common.utils.file;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.exception.CosClientException;
import com.qcloud.cos.exception.CosServiceException;
import com.qcloud.cos.http.HttpProtocol;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.region.Region;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * 腾讯云存储文件操作
 */
public class ConnectTencentCloud {

    protected static COSClient cosClient;
    protected String secretId = "AKIDrXy81cx1oKaZHirjzyg8JEsGNDm34oHT";
    protected String secretKey = "xe4C4g14qLZWBaiZ8SVHm0xd290atvgA";
    protected String bucketName = "ricepoint-1305004688";
    protected String apCity = "ap-nanjing";
    protected String host = "https://" + bucketName + "." + apCity + ".myqcloud.com";

    public ConnectTencentCloud() {
        COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);

        Region region = new Region(apCity);

        ClientConfig clientConfig = new ClientConfig(region);

        clientConfig.setHttpProtocol(HttpProtocol.https);

        cosClient = new COSClient(cred, clientConfig);
    }

    /**
     * 上传文件
     *
     * @param localFile File文件对象
     * @param key       文件名
     * @return 文件地址
     */
    public String uploadObject(File localFile, String key) {
        try {
            // 指定要上传的文件,本地的路径
            // fileKey 指定要上传到 COS 上对象键
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, localFile);
            cosClient.putObject(putObjectRequest);
            return host + key;
        } catch (CosServiceException serverException) {
            System.out.println(serverException.getErrorMessage());
            throw new RuntimeException("上传" + key + "文件异常" + serverException.getErrorMessage());
        } catch (CosClientException clientException) {
            System.out.println(clientException.getMessage());
            throw new RuntimeException("上传" + key + "文件异常" + clientException.getMessage());
        }
//        return null;
    }

    /**
     * 上传文件
     *
     * @param file File文件流对象
     * @param key       文件名
     * @return 文件地址
     */
    public String uploadObject(MultipartFile file, String key) {
        try {
            // 指定要上传的文件,本地的路径
            // fileKey 指定要上传到 COS 上对象键
            FileInputStream fileInputStream = (FileInputStream) file.getInputStream();
            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentLength(file.getSize());
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, fileInputStream, objectMetadata);
            cosClient.putObject(putObjectRequest);
            return host + key;
        } catch (CosServiceException serverException) {
            throw new RuntimeException("上传" + key + "文件异常" + serverException.getErrorMessage());
        } catch (CosClientException | IOException clientException) {
            throw new RuntimeException("上传" + key + "文件异常" + clientException.getMessage());
        }
    }

    /**
     * 删除文件
     *
     * @param key 指定要删除的对象键
     */
    public void deleteObject(String key) {
        cosClient.deleteObject(bucketName, key);
    }

    /**
     * 是否存在文件
     *
     * @param key 指定要查询的对象键
     * @return 1代表存在, 0代表不存在
     */
    public int hasObject(String key) {
        try {
            cosClient.getObjectMetadata(bucketName, key);
        } catch (Exception e) {
            return 0;
        }
        return 1;
    }

}
