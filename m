Return-Path: <SRS0=y9k1=4N=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A45ECAC5B0
	for <linux-firmware@archiver.kernel.org>; Sat,  4 Oct 2025 06:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B0B2C4CEF1; Sat,  4 Oct 2025 06:46:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85D7AC4CEFA
	for <linux-firmware@kernel.org>; Sat,  4 Oct 2025 06:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85D7AC4CEFA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59429oGZ005808
	for <linux-firmware@kernel.org>; Sat, 4 Oct 2025 06:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Y6/zRnWYNLoOXBmscmh/Fe
	BF0sIAegEfa5zkvbjULxM=; b=B33PPQ7VEbDHrt61XGoM+pW78JjqRdqFkzlQBu
	CwIcXjeRoQDPqzc2zVN0v6IR5/6RSG6Ef4bbuY75ShY9OgmMYzn6M8uL3V+pAQIL
	QIUQ5WLEV9DsgA3jiSbjm0V1hEpoIJYoUhim6o1LXzdW8C5gj5rqk1TRUgxBBAQM
	tUTPLuYf0WeOehoeunPmzQyfKYmYwbVTcFb6BOtCvSc5GulDyF2qkzd+Yr8AM27K
	Tk3v9LlN4YFaB9l5GC0eiLO4eLUSiuZNUpL063rgwEStYc6Ma9upCCaYpdVv4tYa
	I2BC2aXG5uUI3ftp/Cj7QdR0L5DWM85HaHTtqdrU2YChlyyw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jthprbw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 04 Oct 2025 06:46:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-781171fe1c5so3133250b3a.0
        for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 23:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759560363; x=1760165163;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6/zRnWYNLoOXBmscmh/FeBF0sIAegEfa5zkvbjULxM=;
        b=BL0q+Gur+xT0cOJYvEW8uS9hX6cAC3S8itsl/YdzIl2l/5PxL4SaMpm/gBmhG9eHjc
         Lf9pgO8Du5/Uu+RL/5vy2g+X9y9uaxIcBK7SmL9b4gFyA6iro0UJ+39vcbUNzvDWbOBd
         RHR6Diybe9vrUP8M3a5NaXIf/hqaO0QmZD+O8CONu6VHJzKDokKsZnsvrChg00bn8l72
         oxXXNeQgmFaMylxQUn68CgJ9dua8+Obmm6YSmjMrqdGuqHQfWACkuqXgqATvYTvk5EWB
         fOFpzClLf4A7Ny0evMQZewHXU8YmXA6ySD8hSwA0vXf7DHfaibU4TP4yqi3ovL3pqkcQ
         sZpw==
X-Gm-Message-State: AOJu0Yxw0fTBD+FNTNs7HjZmuIoqoiglOe1JBPhLPuJQCx4sXEjostYV
	9G73BeiA9u8Ov/vU5WMrPgK4bkW8NGZxi5zP27rGdcf7tZWEyL2qmPNgm2S3V4ajNuZK2CTowje
	JmZ6ytZL7vQMSKzjldM1UKoEzsCDR4Ju7opq5d8yWr6ibfJb4ma2NuVEs7uQtNYc35dXQPYhh/g
	==
X-Gm-Gg: ASbGncvyM2RiVxi47mSrfCoFjcT+SJvNFT3riPSH64OgKMVcAbLVdBPM6rhcy0uLDry
	3xXs85WGKCCqfI/xSIooFV0d0jR8w17HWZk0SkjXDSLIJNT/+LUcq5OBsYPwFRBbj91SPQEadcL
	mbaB7BBIXIZpZbGjMm2vn7pGWw2s3ICHsHDhnUpmHi1OjrENgpHeeHCT72L/mC3cz5JYp9vUXlx
	AipuaopJ3TdgOEaBeNfO8tubPTSM9p3WdCOaTJ6iY67QatIaxKCCvoBR8pT4tdoWHuHh26QdB+g
	fzNNigUF3lnnEEGwPC4LfruTXDwUI/RrtLThkhDXf5fuwbes7/VmIE2J5h9i+eQzN9GZCqyZF14
	cDg==
X-Received: by 2002:a05:6a00:2406:b0:77e:325b:f614 with SMTP id d2e1a72fcca58-78c98d42c3emr6573917b3a.12.1759560363442;
        Fri, 03 Oct 2025 23:46:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbimLESoHNBY+hqRdnqP9fJdjuKfVk83uMe/dkOVIv2ThYVKiqi9WMY8nEV2sm9HBPDRtjOQ==
X-Received: by 2002:a05:6a00:2406:b0:77e:325b:f614 with SMTP id d2e1a72fcca58-78c98d42c3emr6573893b3a.12.1759560362958;
        Fri, 03 Oct 2025 23:46:02 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206e6d9sm6737763b3a.65.2025.10.03.23.46.01
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 23:46:02 -0700 (PDT)
Message-ID: <eecbbdb8-d60c-4fb7-8401-78e6109075ec@oss.qualcomm.com>
Date: Sat, 4 Oct 2025 12:16:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for sa8775p platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G62xDcMF5csYkascpyytZU71AQ6jbWG8
X-Authority-Analysis: v=2.4 cv=N5gk1m9B c=1 sm=1 tr=0 ts=68e0c2ac cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=oDff2y_3zH1LrGV1VwkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNiBTYWx0ZWRfXwfc8h77pnyCb
 0JiwW3bEPxQ4yEIwx2bcGNY24TeroUDdO2X895Oje2hQUkzJq+5//MSDNl+J5ci0DpTR0+2uUK1
 ILNmAw1IeuMxaj+7x9G84mJKIRDl2ww+FKY8+Ex4F3a8yefwZeNzp2ybYRlX7I3Pz6AeXyBPSoO
 IIiZo4X67cM5KX4tqzXjrnkJSvg4txEJUJHmb3besXR71uo2tSgpTfaXe1f+bWTlSxoW29qlVNI
 xB0rNICIT9+zkWxBTZrtO836HRsR1zIi/sptnaQYOADm1boZXocY3RvdoTFzT/HNqqy0/2zD0X7
 imottAIVxDQXTimabsktoQkxljkiCNgDncsxEqan4HgYNgxCc4IDBSx/OiTC1vTezgOSl0BYchU
 mBEmOfXOrnD2fBjr7KHKSX/e5CX5cw==
X-Proofpoint-ORIG-GUID: G62xDcMF5csYkascpyytZU71AQ6jbWG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040016

The following changes since commit 757854f42d83aab44a72eedded3485887798a4fd:

   Merge branch 'amd-staging' into 'main' (2025-10-04 00:13:39 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-sa8775p-dsplemans-163

for you to fetch changes up to 80e2ccb38d412e80e2232242dab1bf5631e78560:

   qcom: Update DSP firmware for sa8775p platform (2025-10-04 12:08:29 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for sa8775p platform

  WHENCE                  |  10 +++++-----
  qcom/sa8775p/adsp.mbn   | Bin 6684672 -> 6692864 bytes
  qcom/sa8775p/cdsp0.mbn  | Bin 3080192 -> 3084288 bytes
  qcom/sa8775p/cdsp1.mbn  | Bin 3084288 -> 3084288 bytes
  qcom/sa8775p/gpdsp0.mbn | Bin 5873664 -> 5881856 bytes
  qcom/sa8775p/gpdsp1.mbn | Bin 5844992 -> 5853184 bytes
  6 files changed, 5 insertions(+), 5 deletions(-)
