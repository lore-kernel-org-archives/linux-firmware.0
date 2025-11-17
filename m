Return-Path: <SRS0=Mlca=5Z=oss.qualcomm.com=jeff.hugo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF06FCEACEF
	for <linux-firmware@archiver.kernel.org>; Mon, 17 Nov 2025 20:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57116C19425; Mon, 17 Nov 2025 20:03:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17F63C2BC86
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 20:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17F63C2BC86
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHJGThQ3916356
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 20:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c26Rp3/bKYNX/PJuKOfFYo
	CK6vXK1wp27/21pquFoEg=; b=LKPOV7lgxVDf9tlS99t1TmamWDMgqCe5cEJyck
	rR02DPFzEUzvgIIWt87CUznIU31lBg3sftKM9Fw+OG0zJm1CAGjUjF3FyVH6rjkY
	iEJcpnC4tmgXp/cc+/4EfLQPMtyqLe9RVYhs/YtYuXm3eT9dtImQ2r6+5Kck1yQ0
	VGkeq8+69kSAVNb5bmLIPXRz0EpXAidiD7w1Ncwj76wWF9gXi/MRXgvw7++9XxfP
	zgwztO2xAgmuiHFCvRX73U0O2jwzcyEIzLmNWsOraAH66kJysCqcASrs2wBCYwvb
	XiOSeDbmI1tathD8eT8/Z25e1fo0GwuzLPYcb3wXX1DkOxLw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fx9j7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 20:03:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso5669856a91.2
        for <linux-firmware@kernel.org>; Mon, 17 Nov 2025 12:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763409798; x=1764014598; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c26Rp3/bKYNX/PJuKOfFYoCK6vXK1wp27/21pquFoEg=;
        b=O4UlbhPQ5P469vqAHtrmOrX9Ij+Q/4SrJJjQ1TVkRSMnQPvGbJcR2lJGMKfrkxLNAD
         t4lYyqE3A1Iqo39pDf71DrgOoEDRw0R+91psIvenwqZRHg30nk5+aN5yBHxplvrw93WY
         udDyuoUXoQvn3r+E1zYzyv7WhD1PGSQUutMMw1yKiI3g/a597LsF52/ijqUq/YdVmx/C
         Zz1Lv/gaU3SF7idHtO3Ir1PELZYDIJV48JOX5bPgZZeB3a+sw5XbvcXreCStifCsacmo
         fkfRCIVHXYTyyQZZjWSKNiiGDahWRSYO+KOUW+SI2nyXjLYWoBlPe99ztMqnKDex6gAd
         Vrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763409798; x=1764014598;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c26Rp3/bKYNX/PJuKOfFYoCK6vXK1wp27/21pquFoEg=;
        b=cJosqCV2LGIskA6VHFrIaR+jbGA9E3zNsShXySpRTi+OlLxDDC4TtF8poefd6LI9Xg
         6c4t0JzRyYOIFhi4SJPJfztND23tx/MohU9gJzuffBXTXUtmmEOHHC5rFfhzm8z3REGr
         PyBnVuTTDtoOCx9OTv+GSt0J6mmTjmfMZwKWui8BPZDh8Jcj4lwi55UDX7f8MMvbxXS8
         7xjB5x2t0xHJ98YF6UCnQl5PUhXmwjdseZJWsfMMswLt3U8RU7ReiRqTpHzJZ0xXH4/Z
         CwGrehj1xcetbZNMaEFaIS2RUsnlaEE7Sbf3FfyR4IqhreIWwjXuxG5VowNCkU0/taV+
         Dr5w==
X-Gm-Message-State: AOJu0YwmT5psFyNcWO4e4rEJAEICFYCrzpuy2sN9pKVzkF8ylPrOWGGG
	SVhzFJQNa3wzkNN01c+OJNMgbY42AnNVzi3vdUT5W4fTt+exjaaPF0RLLImp49JsSSczWJ5tcFm
	nWF/oys73YHorTM6G4tX1KiWwDwdipbqyg/0prXbx/HED258II3hq05L2fX2dYMI7FEl2sWc=
X-Gm-Gg: ASbGncvwj5rSGgdznNtb4KsF4LdlTqGrJy7MvC3pUkj6uCwjWNpgxrPO6uisx67JsnR
	ApO2KuiADXTuJ0UBhzMbvTP7+DbwbDQMgfRXcD9w8lMx4+PLLPrTZfZwgYFyGOQc20pzLhW7Ap+
	efHNUyreAGQs5uzJ/OV5ZfxeoRi7NOzu7z59zuPTrhnsRfH7MMQc8WuHIDnHgkB4j3QiL42SUnx
	X+eC407p8GiBQ0vrY3cM8cxitbZ42ec7Lvk0EjDZnprtoIfU6CPB+Dw3WcMjckpzDyOowAaEFKP
	c095aYaHBcb1TujaLU+k2T+CPHl7QqlfZ5VIFre456D3CLgXdwM2rk0rhuIzjd0Q3zZVL+MVYVB
	Vd5fZpHKBeBxtXTotMWlqZKLUSLrdi1DralXdDEotSm5CK+T1RwPfOqAxy/WL+7Q=
X-Received: by 2002:a17:90b:584d:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-343f9d90c97mr12586973a91.1.1763409797838;
        Mon, 17 Nov 2025 12:03:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTb88C+0oHSffz3fukesKEKYpXaynlkyYjtfFlUHACP4e+GCA21rujoM2xS6sbEMBlwF3WpA==
X-Received: by 2002:a17:90b:584d:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-343f9d90c97mr12586948a91.1.1763409797329;
        Mon, 17 Nov 2025 12:03:17 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3456516cf7esm11126035a91.12.2025.11.17.12.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 12:03:16 -0800 (PST)
Message-ID: <13afa249-cfe4-4c19-96b0-ca9506b2fbd5@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:03:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Subject: [PULL]: Update firmware for Qualcomm AIC100
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BWad60ddA3aSvX1AEU_fjYXFBwhU31Eo
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691b7f87 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=NpLpmiFu_pJ0in__f2kA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: BWad60ddA3aSvX1AEU_fjYXFBwhU31Eo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDE3MCBTYWx0ZWRfXz04jWGNZtL+T
 +WnByibZBXNAvNC3jshITR2qsObb4JEzUW+N+Ep4nsXrXSTYZUpmY0rYvkdagQ8g/vKc4QRDMCB
 t629+IWijDAjTuJ4MnLmxMtKI9+wcsXpiQqkICBxs2+3D1OI2UGh369uSgf7gZWX7cj/pr2W165
 XNCGn+R8pU28SrmJMPlZ80uJafQlthIaEahgQwzCw8MzRCe4rIeA+0IciO/wNjfldmBUUSathpv
 dU/vX7m5xnuxUUDS0Q+yqueQoo4NpSVU120N/IYNry+SdHD5pd9krxhR9I9Uw0sJ5sd9V7at4NS
 M6H1Wb6qg5AAlil3VEeAnSofscj6ScatkpfGxsVDqwrYng0AKg/1jN+Lq7GujZpJ+Qn3mxDrT4V
 /PycbsIVw01ABDhVXG1PzdC7XAIJRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170170

The following changes since commit 43a0c8df58aebec0a9456fd5ff4ef955c627d0c2:

   Merge branch 'mt76-20251117' into 'main' (2025-11-17 17:42:57 +0000)

are available in the Git repository at:

   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_6

for you to fetch changes up to c710fdbe961e6e04239b989d688aaf56cb6d90e2:

   qcom: Update aic100 firmware files (2025-11-17 12:51:53 -0700)

----------------------------------------------------------------
Jeff Hugo (1):
       qcom: Update aic100 firmware files

  qcom/aic100/fw1.bin | Bin 2180920 -> 2180920 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
