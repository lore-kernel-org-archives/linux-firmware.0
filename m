Return-Path: <SRS0=GnA5=5M=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765F9CCFA00
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Nov 2025 09:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D428C116D0; Tue,  4 Nov 2025 09:04:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1476C19422
	for <linux-firmware@kernel.org>; Tue,  4 Nov 2025 09:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1476C19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A48ggAd1470215
	for <linux-firmware@kernel.org>; Tue, 4 Nov 2025 09:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uWwnH0rxeD032gwN74YWS8
	PCVMbyugPHqovJoEam8Uw=; b=W2NyE0/NPbrPrxFGOBQ//4M3AVds64FGTw1apl
	WDmfne89AN3hyjIC52kqQuaNABAs7lRJd8p3eBfB6hqLw2y7waQClVk+QncXj6Dq
	Lcq50PERUhXqZu2alsKlcrmeIRk5s9OTJ9ns6C4c2I24B9fIK2Qe375bF+mCL55U
	GVoH9TBUiXYZXVk00lI/rrPo3gERrKmfQZdue1IeaAr/wx5cvA5vmtXOUVvLp6Ob
	1UBQ8ePOsEwnWqv81DhYDqeeb3ZdtqUJu6AeKYJGcNFmhAv1faI0j262/m6xowEF
	F3Xxqhe/ua0wJYeKQRD37tjfIJ2dyorvL/pJS99RqXpQO0Vg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffjc2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 04 Nov 2025 09:04:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-783c3400b5dso3637880b3a.1
        for <linux-firmware@kernel.org>; Tue, 04 Nov 2025 01:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762247088; x=1762851888; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uWwnH0rxeD032gwN74YWS8PCVMbyugPHqovJoEam8Uw=;
        b=QC0If4kZbZgMXv/7kYSnPv9R1DdZOs1QtAlHLmw9lq7pdAt3vQovdhRIXWPhm3S/WH
         SoTocjOATzILG8uj0UKfZXU2IjTCiuGDC5BQYUshX5y8PaAZZRojTJtuDA0546z/oRae
         LYhZc8Awn5eBQgYgCfkymZMZze4jWD6nEZJ3qltwhcjTDXzIu1QPp8+IXR4jgr8OQmrL
         XtHlU1dmnOfs/fU9TuRynR5h34BYaBNFWYWihDqCwtiWLbalfnF2XqxXkpPM8f+I1j8d
         ro1cs5SiWsdyE947HXm9W9jIYLZFhBzIjONRHqbYuEeWnC0vnXmHzZ0HtBURiUiTrvdZ
         Ih7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247088; x=1762851888;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWwnH0rxeD032gwN74YWS8PCVMbyugPHqovJoEam8Uw=;
        b=gYVIibvqYeQssF9M9XbT/0bGH4JjhJOzhhysot0sLvtioLqc7/phJyX4I/DzMRbQxM
         r/URDXfYw6SsKEKuqP73AyhQ++68ZwP9B+EL+OARmaEnsR1ickqqLgUlICZ3kcs2nxRi
         2EnzXKPi9zGCdyhTBsqaCuJWMTORnlTiKT1aWxTi3zBNYNFo5HqEZIwGdzy5893iK6jQ
         oj0vWSmtTsPyB7VaiYn9ERuUCHN6E6Cp3Ri4ybu6KUlBgDBEPBnk3EBJp1fG7sgGlDR+
         140BLxsTpgoRV7EWuq+FlRyl8bCsU5hrNz37GakX/sPxTHSD26JZAaHGlfGJTeQ2Yg5I
         Y5gA==
X-Gm-Message-State: AOJu0YwuKnBqrzG1nbY5rZhFkJGt/0gQlp7XF3K5ASeZY2Svgo2ZTTgF
	cXk+BJIzE0kCSnE36cTfZl0HLN87GubNTfJi1IDf7t6xSdRlkccTGzE8RCVH1R7hkswcmgrT6s9
	zLrZYgxoTlEyfNqK9yT3N3D7vJzhksaC+ov1dp05tSYN6ZkKCOQr6aZDnkIC9YQlBeVQSKSL1FQ
	==
X-Gm-Gg: ASbGncslRc/9jK1bCSvgu0FepCiaXPlng7t+sg6QjEzrZ8nRrsIlYqgLl6CUT4xKV85
	qumi2hj5g+AR0hzd5A96kF8DvWxCVzsXQuqwHI1fjUay7Ycs+Febkk3f6qT5TSHOWKWegYokcza
	sRi2D/w8aatJnAWzcml+OMNq2GSpH/O50xwbAEvPVYcAJMfhHQ/yzd35WdYsRlgoFu9SUulTuBo
	i4DEg9/Hb5WSLA8/aQ+YV6d/zeJEQxeMJXZaUkIlQvL9n/IihOFC4LBrsgtbduRihr31bJs4JOr
	P7HbAPCg/JCclZTNY5HMRYrf/QmRKDirCuv6IXrhf133W5ZtUGNx0zSrianz0sHpi94Lq4Xbtk1
	msykpNmLXfrW2ApLkOKsFgQxbcznHT1PfWs3og+RUCnRlQxQ4r+awf62Kw75ArX2C
X-Received: by 2002:a05:6a20:9152:b0:34e:63bd:81b4 with SMTP id adf61e73a8af0-34e63bd849cmr2482641637.7.1762247088094;
        Tue, 04 Nov 2025 01:04:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhTh1TLw48faU+mrvWaESMjMulNv5xeQL5aWmfuuA32IPmQ5wTAiK0raCsQpU7Z5hhkVrfFQ==
X-Received: by 2002:a05:6a20:9152:b0:34e:63bd:81b4 with SMTP id adf61e73a8af0-34e63bd849cmr2482567637.7.1762247087184;
        Tue, 04 Nov 2025 01:04:47 -0800 (PST)
Received: from [10.133.33.128] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f2a7db8asm1685935a12.14.2025.11.04.01.04.45
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:04:46 -0800 (PST)
Message-ID: <0fe8b17a-977b-48fd-8eca-1fd0b5f15e5a@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 17:04:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add SOCCP firmware for kaanapali platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909c1b1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=9SoyFESwWrJirDBRFrEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: lA2wQcAn-IWcoQtVqmv40yAzSyixlgCK
X-Proofpoint-ORIG-GUID: lA2wQcAn-IWcoQtVqmv40yAzSyixlgCK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA3NCBTYWx0ZWRfXwzILiUh/7/2p
 p6vXpJe8HUoXK5BLDQoyC2BFpFFBo4wkSF7cMn7UN8Octdg7VSzIMUV5sAaKJvK1FAIt2w70f5Z
 cLv+YAtV+mWU4CMWY08c9x4YwrY6+/Fir4QXq8RdEaHQmSrXibzL5X+2mijmahmqahpCi4EcQEv
 ohWB7u/1XrEZvLu+1QP00Y6dxKbQ/IUxIGVa+xvAE9RGn9WotbNI2VyqKTrEPHAowGjNs6Vbxbe
 /oWYWxGA8YzFqizQEfa5YCaOqB/BBs4GZN2cCjfWl/hTv/WYvIe7vwVVHILcIWvl1o3p2ECs4Sh
 FvFoXeO+CMOzXEwo/hPiay3fcEAINprbaVdRaqbpSDNs44sc498m/pxn+LL8M7kC2yS+2g21JoS
 jSCQpK4buP9WmdQfUzEwIz1xC6+f8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040074

The following changes since commit 4a1728d0f464fbd73560239e2d907f8f3f5614a0:

   Merge branch 'robot/patch-1-1762131560' into 'main' (2025-11-03 
17:39:46 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git soccp-114

for you to fetch changes up to 08a87b01cf1ff12def895cd1cba418d4d7ff432f:

   qcom: add SOCCP firmware for kaanapali platform (2025-11-04 16:56:50 
+0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add SOCCP firmware for kaanapali platform

  WHENCE                       |   4 ++++
  qcom/kaanapali/soccp.mbn     | Bin 0 -> 2359480 bytes
  qcom/kaanapali/soccp_dtb.mbn | Bin 0 -> 94008 bytes
  qcom/kaanapali/soccpr.jsn    |  14 ++++++++++++++
  4 files changed, 18 insertions(+)
  create mode 100644 qcom/kaanapali/soccp.mbn
  create mode 100644 qcom/kaanapali/soccp_dtb.mbn
  create mode 100644 qcom/kaanapali/soccpr.jsn

