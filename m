Return-Path: <SRS0=xk9r=5B=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E01CCD1AB
	for <linux-firmware@archiver.kernel.org>; Fri, 24 Oct 2025 08:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFC4EC4CEFB; Fri, 24 Oct 2025 08:14:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2B6EC4CEF1
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 08:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F2B6EC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3MHTr021672
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 08:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cqg+8CpatYjRtOkwrsTfy0
	QQrb5RKxCuSYLZs69cCsk=; b=KCt8Dfh4Tn5H6aBxfghrRk4YGj4PapzesAxuMy
	nVztIwRYm0vufBYQgJVWjvbvkPpupMqIAtcGsClwkIU/yjs3pGjSQaefk4g5aX4F
	Mw6AE/NdPTIjq8BSHMsKSLAKRvRH4UASkPb0be7IYyj9r/wcHV7EN7jA6U4bhWKV
	/uxjaO9hVsbAxKv/lhS3V13B5eR0OWUc59DmfNK3MbFkq4ZCUcE6QNsktBRirDGl
	A3hSbn1n3M4M1NyGAk7ZxQYBpTHzDMm4L6J2MfQUhMbzFH0TryuDMpiLBDjK7RRl
	M83x9abo5mvihfEgOZmAAtXvEu9YDO7JTmRhtFWoRsivGrDw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8ng9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 08:14:53 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a264d65dbeso1230498b3a.0
        for <linux-firmware@kernel.org>; Fri, 24 Oct 2025 01:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761293692; x=1761898492;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqg+8CpatYjRtOkwrsTfy0QQrb5RKxCuSYLZs69cCsk=;
        b=OBsXbPKIQtJsMQiiSi3dx+mml6/A1y2Pq9Zb22iho+SQQEZw6TdJnouCh28B735cRT
         YGQA17bcxZ0nJSSwOb7O+wI9xBuzinSR0CCerXETNRem6a+EWKK5BXEyZ9im1J6wkbAT
         JxrAn9FMHGPOEdjri1F3qoVp2d4E2fNhOuJS0DAunu8zebOSYE9y3BBynYGhb4HsQ/sV
         CuJ1ww3S2PsaiyErHCgaegr4P6rWZkRMrimYP/thBBoWJcOOBiDvAJB4T2Nz/NNVhM3P
         /V99HPT83iHtg5j4X3Q0nDvtzkPxcRI1UkosXtRcQSOCkT3QHpPR2gz4Flv87ebY85Ci
         EXIg==
X-Gm-Message-State: AOJu0Yx0vqc+YButvFX+iW6BF2DnyHwYWBKun35hLU2DZ9yY1bX99O7N
	PU0P0YhYQjV2UiLxAp64ZHIhvSiSwoBt6Un7CMbqTFkdGz3l2mAeYz9nrgBrq3JPKKue5EuaHet
	+RfZxDtVXXTnU1n21QgTbRiN3mEafmmkdIhskdOi3JzuNFT1LdoC506il7/5xZ/97yLi5sNNOKQ
	==
X-Gm-Gg: ASbGncsI+fdccSgf0v8SBPRR4SmNfZMw3FPZGZbj84cCgtqAs2oZCRKmgTIdMf/zJxT
	KFfCq83zXclAB0qklCmtrWNfLSJBHKRixaSMDw5/Vg8t/rx+cv9Q9NQGKupcH5sWYXiKFBMOu5x
	kUuT+o4sKIzSvZ7zuUJnWUIB+yhck5YsmT3zhWT5Qaqc7ZFOhhmvNPGTfQPv52aa1Odgo0naTlN
	NdD8iLzr3N+aaTuUTkDjfLRUP3BynGiZawU0Bx14rO9SfWkLY4PnvaG4pUT0Eps13CBGyHJiKBH
	kpQMiNNOQ9hFBGKfKNclEvLwxRLjvuRooFpY8XnYX1SbEcevaTKHzDDh66Zlsoh/IdO9+2Co8T4
	mT5PHfDFWv5qO8Q6hWps=
X-Received: by 2002:a05:6a00:1816:b0:7a2:7724:55e9 with SMTP id d2e1a72fcca58-7a27724623dmr5717350b3a.7.1761293692563;
        Fri, 24 Oct 2025 01:14:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI/1IKEI+YR7wFr6ETDgHxlsPzzWD31og556bQNlUOqeUZth9MD9PFxye3kMq4lmxrKxBcSA==
X-Received: by 2002:a05:6a00:1816:b0:7a2:7724:55e9 with SMTP id d2e1a72fcca58-7a27724623dmr5717333b3a.7.1761293692073;
        Fri, 24 Oct 2025 01:14:52 -0700 (PDT)
Received: from [10.64.68.213] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a9e580sm4942661b3a.17.2025.10.24.01.14.50
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 01:14:51 -0700 (PDT)
Message-ID: <3f667d0e-4262-44e6-9615-d5b5efc16197@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 16:14:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add ADSP firmware for kaanapali platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xk7Cr8dXD0ytYLd9mNJsodm7Cg-5PWMw
X-Proofpoint-GUID: xk7Cr8dXD0ytYLd9mNJsodm7Cg-5PWMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfXw+i8fUeNqxKL
 BvHM0fxonQoxF4Vk7KxrKOOeISPh0dDu0JkgFjIUfqoOPVRIqP3gQnC3mkfvQSuDsn3E+niyoor
 d+/EfkGFh9IG6iDjMHWke9dF717D/SiiH86gQ0gePE/2vUzrOO9i9ofTGd8TlWNU5u2mW9OsdJN
 1zG+U/o+2jqE3NNzqC2gyQ1b5axcgPz+z0KxUyG7KR+Cb7NfPeXNkyNdRUmwwqDk1FA6WdNAEIO
 cNaFabiroNyEbbJY0pseRnWC0/61wc34Nqjn7QHG1GbDC8RfjVac0/68wzFCkZ1B6YWHbGbCFOi
 hfXoxSZNqwsG8gGZzNKp467/Yy2N2lrCm9MC16wMyBZ6w4O/77tojf6UdEfsfpRX+GBQYF6R8fK
 ZpV7SkO3D+NFD55d1ZzVYeaf7POczQ==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fb357e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=jzS3qRsq_p5cWbUofIwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

The following changes since commit 19731a36222e7b1ca09be090a19bfd89640a837f:

   Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23 
13:30:10 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
1024-adsp-knp

for you to fetch changes up to 120cdcac887b65c1f259b345ad107492cbf597b6:

   qcom: add ADSP firmware for kaanapali platform (2025-10-24 15:46:14 
+0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add ADSP firmware for kaanapali platform

  WHENCE                      |   7 +++++++
  qcom/kaanapali/adsp.mbn     | Bin 0 -> 19879944 bytes
  qcom/kaanapali/adsp_dtb.mbn | Bin 0 -> 184120 bytes
  qcom/kaanapali/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/kaanapali/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/kaanapali/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  qcom/kaanapali/adspuo.jsn   |  22 ++++++++++++++++++++++
  7 files changed, 102 insertions(+)
  create mode 100644 qcom/kaanapali/adsp.mbn
  create mode 100644 qcom/kaanapali/adsp_dtb.mbn
  create mode 100644 qcom/kaanapali/adspr.jsn
  create mode 100644 qcom/kaanapali/adsps.jsn
  create mode 100644 qcom/kaanapali/adspua.jsn
  create mode 100644 qcom/kaanapali/adspuo.jsn

