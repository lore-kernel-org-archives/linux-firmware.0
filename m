Return-Path: <SRS0=hVQZ=7O=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D86BD232C5
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 05:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E914BC4CEF7; Fri,  9 Jan 2026 05:45:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9AA1C4CEF1
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 05:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9AA1C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608JFTEb3019302
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 05:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gCdonVwkFfCq4cpa5YUUw0
	r4yUi2jrji39dCoIUjEsQ=; b=bpE6OiyMM1vBLVHBVGK8rFX7KooDK/gLOBiYMx
	smxxnTlcHNxaaXhkHaTtjTryc0wdEdUXrSCXl57wZYk+OSHxPB+/JuT5c9ZMMHUz
	hHs0u6qXjWqmhBuuVow2jbbNN7Cy2zOoy+IZqvfYPm/UrrrRjrl6A6tvkia9h/bE
	bJJcUKAnJRIHYgIG45geFNGrbOtC9CcY4ZrYn/l3g/A7cIHKuyhEJtXtX1YSLI3D
	7hfSw0CvMR2Eioh1u/tmE1xT7z5tkl3OIcuHBw5IbAZzRlS3QKtZ7eX72l/qEQmx
	4phV6v6xUQ7ul7ZjE9hQGvI2e8DGGnVYY0tlKC6GOc5kyxfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3hexa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 05:45:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ea5074935so4380851a91.0
        for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 21:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767937532; x=1768542332; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCdonVwkFfCq4cpa5YUUw0r4yUi2jrji39dCoIUjEsQ=;
        b=clPmGDjNw/k3VV+CDo5Xn0ZPJOtariv5X6ljE+6kicJMyMXKan1dwWwlY7QvL0WIZ9
         eTqp3viqE/91Y/i9jkKQblTQJrJvux2ZCMerXpMtVdK8WUMl+927K+iseYlO3Gt+lqyE
         Zo2WY07diceT5XvLJmH2lnJr0DKJU1y83be8qPFepFZpQGgpw+mYJcxTo1S0BEkwJFWg
         yRPZPpkfL2S5wPOMle4w//S8Aa2APstVTp+1pq1KgzWG5jjyonJTsEvZePA2gSdop7RD
         ZL7xIvjhQc9Fuu0ReJmQraRBPSS3NbZx+YEvESFJrke3frPuCAPysTTPAZMedzWmrONY
         44CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767937532; x=1768542332;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gCdonVwkFfCq4cpa5YUUw0r4yUi2jrji39dCoIUjEsQ=;
        b=iojp5Y1+M6RELh2Kj6k91e3W7W/2SHk5U1l2pMmnsP0jiy0aY6tlMAHnEct1c6cei/
         QQyzf9baUtx0a2wWJKWi8erhqd8yTh7QFI+NiO/OTnPqf9fs6m0Zq3ry9KNYNvOfmVqx
         8yVnzDODZlWcb6B3CqIyA4MT6C5cb6KAX1kA9p2Lth5fh4XFl4lRqsH07Svu6xqOnzme
         C2qMF16QYn5qIXoyKfbrQl9at9reiEQEu+YB3ZFq/rA4wTsHBf/5htxzP80/JOdiCJm2
         84kjHxqyCHiy0g3QzibLMM4wu94Ehhx/5wH5MieQpzZMKLIRih7EpM/p9Fy05ezUNj6G
         3TvA==
X-Gm-Message-State: AOJu0Yzn9ap6dSgpp4LFDU2Huj/n7dMBBG8TZmq+jqtmUbDB/ZIBtvXt
	Yphu5ERrLA2A1cxs2v1ojWu4zrdsjKXe4OhZKAqPtNiINGHG7sUB+LEjNnbu5MSKVWy8g/BrwSB
	zySvXsuEf9Qso7hZomVOxEFvkFYx3eEn5YIhpLOcLMvYf2wM4cWEWhG6J0r/oBgEjY82/ic8=
X-Gm-Gg: AY/fxX4zSueIxYYf5BuMJm0dpZ1kPPi0V9Q+8qONhlQpfsoVNogY4r2KU5sjFLwH++u
	pMF11XHrumcERIzI8981sNlDyLFEm3WpCweu0e6OajA5jMWS0CnV2x776PMwX6MKQSfQ+UubTJ+
	eaaryDT+9UK+jdkP9vgQkqVToWDH9fyI54lpG/galuBuzd1VZYFZcieIb0SlUKnuIKkfm62c9Dg
	4EomiTZlVSYZSMnZsmhn6Zo7SJzLDVqNvVeoRrN5tHfRzmQ8dD9q7A6vOnVcpOovB169NCxwn/5
	2nhnd1SSyWnY5gxUtLOPTJBxGQ2bT5Ju72dqHSMofxjVUTg2neNSzOyTivYR9Bc7NENZ5YY+7lx
	P5SVSF2MfU1wtWTOsNBSe117fdwwmyRXNrdCPFA==
X-Received: by 2002:a17:90b:574d:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34f68cf020fmr7271737a91.36.1767937532204;
        Thu, 08 Jan 2026 21:45:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiuv76QjCyexD/f4xYZ7LFOoA4Xg3j8kppmQz3orxONYEYtm7bAl7Blx1LXaXppVVnhyC3ug==
X-Received: by 2002:a17:90b:574d:b0:32e:7c34:70cf with SMTP id 98e67ed59e1d1-34f68cf020fmr7271719a91.36.1767937531738;
        Thu, 08 Jan 2026 21:45:31 -0800 (PST)
Received: from [10.204.86.35] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81dd5a992f1sm1261167b3a.11.2026.01.08.21.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 21:45:31 -0800 (PST)
Message-ID: <62282860-1319-4d71-b917-51a51f37d75d@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 11:15:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: psaddam@qti.qualcomm.com, kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for sa8775p platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jPpFjnsitwYJfvx3wqrN3IMkVBJhZIT4
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=696095fd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=5AIQStmfbL6KtqaEBLgA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: jPpFjnsitwYJfvx3wqrN3IMkVBJhZIT4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAzNyBTYWx0ZWRfX0snF1tMB4WQq
 fEHZpJbsRlUiQrt+6fPbI5FpWTYiJd+1hSB5RUFz+oW1K0bCk01EFniltZYasYSNzun+D0DXCjL
 tWxMOGE+GzxRwiOmvlNKMTcSEmWBCfUez2/zRMFuiIsVmBNiGpeY7FalQu+1BLiqaCwaxZQOx3p
 +sgyRJkfb+8egy6eC0RNZx/ZZrNx+hG0ssVfJCq8cUbkWBwCSkVazSvvofVqQqtUdEgZ5l8lG0t
 QLZdRWNx2kkd1hhGw197x0qhu7VdLtA9+GNcrJ5gJFokxtmdXjAx9VxcjDYAPQraJse2HBXfieD
 JSWZ2S5btmrj9Uw8JQ9loKCGcgt5nfi3PCeiBBl7hSfgkpKwmBNSW2ts5b546sEuZbn59nOXI4l
 DIWFikvvdvS9b/7uiZyZJCKRzQiNsgxmyO2p7ZqeWq4UBTXDUCWnWZQuo7bfjTebKVUaRY29Hj4
 BycE4NgMU8m3xs59shQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_01,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090037

The following changes since commit 9e2418490ba10d9c5dd58fcb56702b687639b211:

   Merge branch 'intel/xe3p_lpd_dmc' into 'main' (2026-01-09 00:49:42 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-lemans

for you to fetch changes up to a5cdffa580e8e6e4a098f6a73b803946ee9f1df1:

   qcom: Update DSP firmware for sa8775 platform (2026-01-09 11:11:10 +0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for sa8775 platform

  WHENCE                  |  10 +++++-----
  qcom/sa8775p/adsp.mbn   | Bin 6692864 -> 6795264 bytes
  qcom/sa8775p/cdsp0.mbn  | Bin 3084288 -> 3162112 bytes
  qcom/sa8775p/cdsp1.mbn  | Bin 3084288 -> 3162112 bytes
  qcom/sa8775p/gpdsp0.mbn | Bin 5881856 -> 5992448 bytes
  qcom/sa8775p/gpdsp1.mbn | Bin 5853184 -> 5959680 bytes
  6 files changed, 5 insertions(+), 5 deletions(-)
