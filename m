Return-Path: <SRS0=Ikwd=HU=oss.qualcomm.com=rajesh.kemisetti@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB08C9833F
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 12:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E16C1F00893; Mon, 28 Sep 2026 12:22:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790598135;
	b=PpHsrud0jmypK+UHS7QlwH453v/qB3g127OsInSX84ea7JfRrp0msOoV9z4AXotxpWJi
	 ElZVeu58bMGT3oPg8ttWXdxm+MFzb8NmsCBuUqjiXgSbTRHLOIiXzruwjuj9YjTTgoh+y
	 WLDydPKerXtJokT/zoBd2uiG6IN1W+T6zi3nVb+Q4wY9TCLNSefLxi/yLB2Z8qEvrq8ft
	 5ot+v9QoXkLq2Z+CuPUm8vi0CgyL19ewa+HB+EF3rJ5BFL+mv+DYhiNwDL5dLEsAjy55d
	 PUqFmO8ujwtnzs30cJWkX5PugGuZoB6g9kd66Y9N4HpeniTh3qle/TbrAaFDpMDS8hQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790598135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:From:Subject:List-Id:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qqN9+orpkKvJvXpUCve9EF8ueJGhn0Nx8ONMi0RRXw0=;
	b=SjvyIVSZMrBQlhUNUAlkBA0lAJilJwwDeTQvPI0ETfEM/dZeo2Ky1oNdRN+/8z62OSmD
	 aJUL6oSf7GtxdQ3qX3xTJYAjiltWib/AwkaIiayKpOPcQDApm0iu7NDI61O3KpM0FId4u
	 VHw7AynvZo+8HfqaLF8LMMZNs/RC5SKd0Qu/PP+YA28h7F+rAIG4wd3DXUl1jxdrvP/1i
	 Qrv7eTVdWcAcCoU1VxIuWKgogelMnApuphoyu84gelQfinBdGELcENFCjF6EiN6VdBkPd
	 oMtKasFsV8xqqOEBJgANTCMRSZu9rAzeCRTIxYW2VBVfhMVIy2jv/CNNToS6zvQSkwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMTMxEzH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAPsRLTU;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9A0451F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:22:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMTMxEzH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAPsRLTU
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 9A0451F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBATpP1450529
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qqN9+orpkKvJvXpUCve9EF
	8ueJGhn0Nx8ONMi0RRXw0=; b=bMTMxEzHil8V8UcVRsrymiAja32ijwRDRIx6PN
	9wLJ1EmR+05AyXv3Vs/tdOri5SnhD0ZsJc00Duj3AUJCcd/+XNI4ryHJAadhkiT5
	wrFewaG/Z1tdgCOmnK0UIy7IBlcxPaJm2Owo2oDGaRRWA/5N0Y1oC7nXDBLZHbQf
	Vb7KwmhjtJI8iT62zBqa2UocOpvimuQLaasduJFhnOt3+Tot/ax23w0ykSfjjURW
	YqL0WGAuSWlE6B4AkGOndNDiCJET6ZqlBg74lwtJQHAZybqLAm8lVzQDIY6/NBmG
	QxKght8i/2v/c1AJvqvHjiYlLf8J6HFUs64oxuwW0M6eghfA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxhbx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 12:22:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so1887047a12.1
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790598133; x=1791202933; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qqN9+orpkKvJvXpUCve9EF8ueJGhn0Nx8ONMi0RRXw0=;
        b=gAPsRLTUSeT3uiEtZAYExEDCnANjg4yYu/XcoT6LYKc95EPlSbGjwxd1ibmlNDfOAT
         EuHfai9sn+nQpN7CHdL8lmD3DEQ8IfOfcyNCTqnsfhp/OMciyyw3d6r8Ofb+0kW3jbqv
         pZrD0DRx4/6xtRZpAVQmvQFgwFh6jWpYaKEfD5Qn5t+pNJrEcGxiJjyxrw0qLdcQQvYD
         XeKvhTV86V2HOz+HCw+1WcRkWoEHG6NrNNSgBAr5Tui0yhfXbkF8S5h6AMd5a48YJ37K
         OE1ce4f6i64EZDslHBQOtW9T3EfjejJrn/UpKXSBhavFepwARSc5LiaWtDyrX9Ce/Gy7
         JyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598133; x=1791202933;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqN9+orpkKvJvXpUCve9EF8ueJGhn0Nx8ONMi0RRXw0=;
        b=sHN5RqbiB1ZIlFpmT4BSkcz8dUZa0QpsHWuNeTs2LuHNgL3HjjfTW21En5UCcLJM00
         6fLegIlj/5Hka7KgfdT9yKhyfLpRYBndcAqSxPhAooRfF6jjACiRI+HulRvgE0OWrOm0
         +17yz2igowE79BNCmJcs1qbfj2ej+vyZHqjPMZoY3klS9hbN7bDRbniD3MNY4xkVRuOP
         +ZFqyUJnlcd+BLQyG4SWJqfKyIlLt4jp7d8REkWiPRI71fK2dubClq7x7sGQxERxZzD+
         hWtnUTkfHUZnopV90AvWs5XpkBvmOdVKeLomvDfX910Df95xyHuueRoRh4pD5pqO+eJW
         Ekhg==
X-Gm-Message-State: AFuF++mlXxudB0zv+Ut7/O0jn/YH+C8/i5mDB64UAPMBVjY1d6AqqeKK
	hCachLbZALV7TpcMLLI2uVOdkxFWB2/hWvLRaUBrCRHjdMKGHe/Q3br+RXD8/AUbqKh9S68B95x
	B7Rce5ezyyxMYfy0iLgP1FBdH7drpzAd4F/+4GVq3vFFqVtMu59rgqCVXNsCuZ7Qhc8HbBL8=
X-Gm-Gg: AYBFou1cNMj5NDbD7FEkRwZh6nirmTFoqnsa2k9MS6U6ag96B1cTHb9C6CIBdBQ9EK/
	3rwcq25NMCAM028nI5hCJb+DeIq4ZJI70GSyUzeNGszSm84ajJ/8P6x8MQvfr5fvNWpb7DBssbd
	3UL3vIARo4Ir+laRslcrg02OOqQOAstsJCPttdZ1vc18PrXm9nXs5UZmdATRwDF7yIBh09hT3Oa
	9fkcWqv6tPMnGqkBkMHPuGEygTjLQPIb4HCm1qDVU8Hwi8jQRCa5fkdj6kaumRMU7qNAfdMkRW+
	RpjGUkJ5V4sMyMwfjadVALVdRwGERrHt1zO0lSZJ5sQAg5Ubq3j/9lWD6TpfHVHvI+MXBVo+CTO
	nJ+vzfZsq4aa+5x0Pgrff03hACcAEct9U5Q==
X-Received: by 2002:a05:6a21:2d93:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3de0e91ddc5mr7061310637.27.1790598132614;
        Mon, 28 Sep 2026 05:22:12 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d93:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3de0e91ddc5mr7061289637.27.1790598132086;
        Mon, 28 Sep 2026 05:22:12 -0700 (PDT)
Received: from [10.216.59.182] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc787941a24sm4440304a12.19.2026.09.28.05.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:22:11 -0700 (PDT)
Message-ID: <4ceeb16c-d6c8-44e4-8a5a-1353040e8ef1@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 17:52:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
Subject: [GIT PULL] qcom: GPU firmwares for Hawi and Maili chipsets
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HJzcPucZhgnmHXa5J3pewMtYzeGaQvDh
X-Proofpoint-ORIG-GUID: HJzcPucZhgnmHXa5J3pewMtYzeGaQvDh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0OSBTYWx0ZWRfX9Jmx/cEgV5tR
 tcxXSiwVVrIqV3QXlDYhzGLKgQ2I5cN9sCdAcKv5fOZ2G1A+KYpN9QSOIUSxkeuAd4yX/pWxFYE
 Elttczn1qvrgj/fzwxaJvz/YS6yhJHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0OSBTYWx0ZWRfX2QT4rKxd2DXR
 9mREY8t16PPvTSU9qpqTzynaxl4I25hzFMGpp8FTRZJyRumTxb7lYrRqnsfKR7uvw3CefU+ehx7
 Y8ZJZutFcgqFhZ7PhXc5ACzERANdvQuNDgxkcJp3+pkjYfWindzN0v2mT/VpQGc8skK9MigmBES
 uTvSEpFHcBcfVYdLO7QQRhDqe5U+sYKXx/vgm1NvinK9GMhe/tYzG30XLinMmPEDv5yzxuQylJn
 rCGp7zFusCriLQWmZmzHO8biwqrRn4dyA2CU64z5Y5wXOLpxGL2lQ7i1a6FC/YU8NsvyR0yETV0
 U7J+Eyc/uZVwSYx8rtNxMwfperjlScfebhvrb2+3ESCMfPzJ4kQHoOuFfqjihhaVpcwCRF67Nq/
 kbjK72uG9aL2Rx8n447TMJ9m4zKvMiY6qCnAekRvQDmtA5U9IlVtBuZOlwLyZ+7wi55pSBONDEK
 wUIkAihITEFSVBh4p4A==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba5bf5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qC_FGOx9AAAA:8 a=bC0OVBRYQE4VJsFlaVQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280049

Hi,

Please pull the gpu firmwares required for Qualcomm's Hawi and Maili 
chipsets.

-Rajesh

---
The following changes since commit 9b858e5bb58d7bf1fc4d8818cb9100aed6d46f6a:

   Merge branch 'rubikpi3-adsp-00249.1' into 'main' (2026-09-26 12:42:39 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
gpu-fw-sep-28

for you to fetch changes up to 28b21de3602284fade6d98ea194ce2523034168b:

   qcom: Add gpu firmwares for Hawi and Maili chipsets (2026-09-28 
17:37:54 +0530)

----------------------------------------------------------------
Rajesh Kemisetti (1):
       qcom: Add gpu firmwares for Hawi and Maili chipsets

  WHENCE                     |  10 ++++++++++
  qcom/gen81100_aqe.fw       | Bin 0 -> 55248 bytes
  qcom/gen81100_gmu.bin      | Bin 0 -> 147475 bytes
  qcom/gen81100_sqe.fw       | Bin 0 -> 136436 bytes
  qcom/hawi/gen81100_zap.mbn | Bin 0 -> 12104 bytes
  5 files changed, 10 insertions(+)
  create mode 100644 qcom/gen81100_aqe.fw
  create mode 100644 qcom/gen81100_gmu.bin
  create mode 100644 qcom/gen81100_sqe.fw
  create mode 100644 qcom/hawi/gen81100_zap.mbn
