Return-Path: <SRS0=CNmX=3Q=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0694CA1002
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Sep 2025 02:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B59C3C4CEF5; Fri,  5 Sep 2025 02:39:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD114C4CEF1
	for <linux-firmware@kernel.org>; Fri,  5 Sep 2025 02:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD114C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IfJa7007823
	for <linux-firmware@kernel.org>; Fri, 5 Sep 2025 02:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KDwPcRNa0rbVgA7T+WwIma
	5LP0uQHxf2Q936pU1JBdY=; b=HczlLntn/35DanrXAmdT5AXIAA6Z+zJ/ulQ85/
	Rs0K7+QkmQiZIL6+Tf98RCUbm6h51g1l06TAJKvw+0vFh3WBnGGuuTMcVHGGIxQH
	OqViOJDp9WD9MD9N2ZJQoglTVMXB13JfJNUm5knF4dSnwOjNRm7eWnOmTKSftSAN
	yUofPF06xPS41ZKqgFSI7HuUMJWS7DExGkIEIk2/BO6Fg89Ie8ejAbDHr84unCAG
	UPDdV4jwrn25faHfewHIgwbDTm+oLaar4QrFO73Hg63Q4UNUwS7YfXFmdwAcFUle
	+lyJWaUih2cQGx79vF9V31upiy+NQRtKkVXCqtIOHk4yax4w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura91f1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Sep 2025 02:39:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737c5efso1181373a12.1
        for <linux-firmware@kernel.org>; Thu, 04 Sep 2025 19:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757039992; x=1757644792;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDwPcRNa0rbVgA7T+WwIma5LP0uQHxf2Q936pU1JBdY=;
        b=SNMDJfnZJGlVZimv5PjZWNnmRcO0h+9xT/BwPLK5S2DlV4bYt5Z2c5glvD86E06MFH
         9qSPrMoRjjQ8hOvc+Lua2a8CpJWH6uwmSxMLI3XseE0TAaKng7OQ3dml/Rzp2x/xo0x7
         gRcRPdi7msHAUUGN/blIPZWFFcGFEWGWRIyYdQV2y/wbgjettz+22pU1uqosfRqoBc/O
         kdcqEDzWs7iLbKEDqKKKh6PefmdMUawtZzvOhWEn+N4LHfk6p5AZLwkpoRbK/i9USnIZ
         nZcPuz95DGHMz4iirU1my8Mf+JCfwDjChiJiVDoBo14NxCP13UKDxtW5BIGOss5gyIoX
         Ao5Q==
X-Gm-Message-State: AOJu0YymIBa8l7fm9PCeNgNhjW2nOipwsAhNsI1+5jvR4nVdQ9NWLKYg
	EgibXFCIla0eL8ckuSpTmpbwFj57Aw5dTW06PuuPaYL2RGwUTb084UHpryvs5vnFzVLW0DEnn44
	VPbpBkLdkkK4+YI39zmlt91uTY1MOl/Kgv7FbBv9PRl5t1mPIuRAA943i4K8aLR1blD/9L6Y=
X-Gm-Gg: ASbGncu3H1FhC/rcqRzSlX71uqqzKJAwXUN4TdCXi4UpRKEjjbHulOAyuC6zTf+8Ost
	98He9HOioy4iEBBrx0bFd4u722cdxqHsOnkSj+fBCfJ9CcSzU3NFe236+VI8tMXq8uicNxsdX0w
	14JfNzfRpV+TOWjE3vNszOpK/4OsaxizQirAAAfkm8HnqRHv/KCEbakBtxvGFFah+brrflBLS8o
	KC4G4YP113b+gMK1R6WVnVPbt3+us2sej2HmWiBzF2BNdcBYUjLeos/Xf7Aw31PD52ki57V1yEU
	XQGf+aoD8XtGpUFYdzv0l0SXLJNnL2qSraSTD1I5m4t6kyT+BFEZWTkA/XSj+z+xmkxEcb8ORWx
	PTQ1XH0fDdh9g/byFhmFMz0kdcdBh
X-Received: by 2002:a05:6a20:a106:b0:243:bb99:a0fc with SMTP id adf61e73a8af0-243d6f37f08mr26452975637.47.1757039991768;
        Thu, 04 Sep 2025 19:39:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEede7Adl/dfHn1XNaB0R4lL5P8upRrxjHnBpFoNq4b4WGG7riil1DCN+GVbOxkGLUnHhKosw==
X-Received: by 2002:a05:6a20:a106:b0:243:bb99:a0fc with SMTP id adf61e73a8af0-243d6f37f08mr26452952637.47.1757039991264;
        Thu, 04 Sep 2025 19:39:51 -0700 (PDT)
Received: from [10.133.33.85] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5209ccb174sm550017a12.19.2025.09.04.19.39.49
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 19:39:50 -0700 (PDT)
Message-ID: <cd3515c6-5a63-40e7-8399-84de460b2f5c@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 10:39:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add CDSP firmware for qcs615 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eeIg3j5AwSiBfXjU7njII0c4Stv7XYXo
X-Proofpoint-GUID: eeIg3j5AwSiBfXjU7njII0c4Stv7XYXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXz29s7LH2LsF1
 rymQRvNhiOApMydqn+/UGX5f4TbjEvgi/C71tM6fyvmwvho4ObKAmpvlHBxrU6aEQWShXstvkeV
 vgTIQ7eSsGY4QwgKMKec/ZMqIwhPOTBcUiZGjXYPqWz5rs2goAhE9eBQpAD4DG/VyyOi29UMQ6s
 yq0vbhS64gzZpjz0+wSDT3lCGiw1tWcm5hk20vluwYfS19oEeLS/EXYs1Xczx5zAntSfEtziFo4
 NOEfbgX4jrSjSfX7KLaIH1eLi9lezIYbUR3DQT0fJ+i8Uw6uCzzmBIAinauGOyfKVUD13iOQWYH
 fSZ8gA2CPeN9Xw5IiFCW3nAVt+vxiDHMmkLGDoFWOQFzdMmAxqTKKBks6Pbtu5Hqb32DJZ9t5zN
 VaGakuXV
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68ba4d79 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=lJl5sfGZQ1qLFPs9QdkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

The following changes since commit 577ee67ffca254fe7ee3a7dc5bcf0b8f749f2902:

   Merge branch 'robot/pr-0-1756931524' into 'main' (2025-09-03 20:41:46 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qcs615-cdsp-9

for you to fetch changes up to 82b34c45e9ffbc2894a7a870701c24ce9a30e734:

   qcom: add CDSP firmware for qcs615 platform (2025-09-05 10:08:14 +0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add CDSP firmware for qcs615 platform

  WHENCE                |   3 +++
  qcom/qcs615/cdsp.mbn  | Bin 0 -> 2774548 bytes
  qcom/qcs615/cdspr.jsn |  21 +++++++++++++++++++++
  3 files changed, 24 insertions(+)
  create mode 100644 qcom/qcs615/cdsp.mbn
  create mode 100644 qcom/qcs615/cdspr.jsn

