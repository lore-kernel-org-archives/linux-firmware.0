Return-Path: <SRS0=Msrc=36=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF30CAC592
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 17:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F286EC4CEF9; Fri, 19 Sep 2025 17:40:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1EB3CC4CEF0
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 17:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1EB3CC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEXPic029779
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 17:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sGJA3IVfyONIZ3rKQmluil
	r10veKxsfLrCzXHTHzGSM=; b=dH+BVm/HuHuVCw4yGry2Vbpsh1ahE9i+pTl0s/
	OXjg/i+jYLMAKJ5rYORR/iEIVHLy71U+8NsZuktFJPUvzRY2OhcfL8Rcv0D4vRsB
	YaWrcAtf/7Yotk2qRLcKHnmz5xGCznRBUpzp7ylmXm7XJiqO5b8KN9dTtVvAro9A
	7UYdFJfOVeh9xnZOjE3N9a/b42qjmAKQSebAajeIWjN3N0gch/SvplpyXXGFC2dH
	QjQIIclSXEqvuon+zBTrxoTTdUEDi09e8/Cm6qf0XnUaLca23is2e9mTURnjlZVj
	hGDL4wNQ5UWkGoi2EZ1YxuO/uPC9dtDBi0fXQ5SHA6retBdg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy138ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 17:40:17 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b54a2ab0f2aso1691512a12.1
        for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 10:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758303616; x=1758908416;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGJA3IVfyONIZ3rKQmluilr10veKxsfLrCzXHTHzGSM=;
        b=qniBjsh9tAXviniXf+fMeE03ik1iKqJ3pU9/QebGoeOzFhn832jFhaMISyG5WQMoFA
         k9tva1Hl1AsMWpHmaO8HSWRTOdT2hybQe+ChdzRio5b+4cB67BMRDDHjAJjmJ+EF5cL+
         qkIZVU7g6OTjcKEvV8buc73+kJnfV4B9OkyF/pV+D001PqEdzbAMJydKn28+r5n5Rg3z
         BZOnOaxH9a02O4MPFHd9m5C2x6p6IJMDA/r4uKrPosbWjfArI8xwlkYgt2hfvx4sn3Q3
         e9bvhldt61kQ2qg9f4xM6uRNELPuGijUR3/cqwyRVId6q5imFyhz0ciDQqvBfSkStEsw
         bgng==
X-Gm-Message-State: AOJu0YwfAor/9KANFXG2GvYp7uW/tGIlOzRI/110UamF2aQUp/k7WNL2
	U/533UwYTgztrmnOXEwlrNJXCF74wqQU/M1bQVIOZAC50vbLP6ETzJWqEIpXTq3MgDeoNHWN8YU
	LMsN3UNyFT+c/gcRUeDJjUbLcHKPNaHLS7JgvIAx9sEBZQmDAuY96j2KH5GmxlhmoTU9Gk02xZA
	==
X-Gm-Gg: ASbGncuOQ8QLXP4cjBSIVxWeKoKviFBAFOmIi6xmHmLxBn099gzCVr5BjoGQ6u1PzyK
	eFlDMDDKhjwxM94MoDArLib7LlvTznKFgOHEKDzE3UxbGsTgfmX9GPlzkut7yt4gzBEM5Ehd7a8
	ObCU/lSUvyhWMSmW8IDfo+l8QJctFr20wdlciLjHZBsTo/IS+gGWh8eTYYheahSVp9G+6LTa8qL
	5DQxxiYq9Z95lp+VOvumkEmKa3XMCg465WD0B4hHbHjqZHAfUVoez2NRKNeVKML0ck8Y2cC7Ovr
	D/MgtvVGL89H3ZwC+Me9k95GXCKxbN4kfDDQVmVtI9GSgQf++UuaEI+g+9+TN+6kBEnCdWP4
X-Received: by 2002:a05:6a21:6da3:b0:27b:546d:2576 with SMTP id adf61e73a8af0-2846320df21mr11061666637.22.1758303616361;
        Fri, 19 Sep 2025 10:40:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR2pEKGzFpHE6byQENDfWD1obiT8sbRbvb0xd9+6TXiQ8n5ZmZ3b4FWTsnDxyQrZFBwdcaVA==
X-Received: by 2002:a05:6a21:6da3:b0:27b:546d:2576 with SMTP id adf61e73a8af0-2846320df21mr11061641637.22.1758303615869;
        Fri, 19 Sep 2025 10:40:15 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551705bd02sm2789197a12.41.2025.09.19.10.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 10:40:15 -0700 (PDT)
Message-ID: <1fb5db0f-161c-49a4-a09e-d6b58427b0ea@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 23:10:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: ekansh.gupta@oss.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for sa8775p platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cPVA9TZwKnLZ0bFw6PTbhmA7ud1bBM22
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd9581 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=ZxxGnm28TyYWOkVWwQsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: cPVA9TZwKnLZ0bFw6PTbhmA7ud1bBM22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2mW33Iv8TO6H
 252GiElowSK1nT8uBjDptYMuTRXtia9eOd7vVJ5t4CqWDHNliZ0gOEbH1I+hdh9MSBnIWyCWDlV
 i2Nv1/zYxXB0Yy58jNhIvTinJUZE7EwSYZAR/XGfhfIGrsj++rW7Aozr8kz4M3n0AWJIa4X7xMr
 JpJRvGpFMyBkO4ymdXOuw/UAdB09bQz0EhgujJTylPHPew+V2bFhlBRRqZvNUdUeVXs2CdgfOGD
 HcFcT2WJBlF1oycVb6sdDV4vxxrQqb5622fByMFj8wrvOQdDaBT0meDrpOS6ZPuVK4VN6ANm5LI
 hI8XQd9jXlaPEW0PMr8EhVTA7hwEUdgHjmv1fUSPW7LHxakLAXfnaiI1KDLVUU9MFwcuxh9f18m
 GEKquFf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

The following changes since commit 3124a51452eb5ba129815583f5b3af5ec0ef5b26:

   Merge branch 'robot/pr-0-1758219630' into 'main' (2025-09-19 14:31:28 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-sa8775p-dsp125

for you to fetch changes up to 69c2e06617b78403fc06eb021fa9c0a33ab330d4:

   qcom: Update DSP firmware for sa8775p platform. (2025-09-19 22:20:24 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for sa8775p platform.

  WHENCE                  |  10 +++++-----
  qcom/sa8775p/adsp.mbn   | Bin 6643712 -> 6684672 bytes
  qcom/sa8775p/cdsp0.mbn  | Bin 3080192 -> 3080192 bytes
  qcom/sa8775p/cdsp1.mbn  | Bin 3080192 -> 3084288 bytes
  qcom/sa8775p/gpdsp0.mbn | Bin 5828608 -> 5873664 bytes
  qcom/sa8775p/gpdsp1.mbn | Bin 5804032 -> 5844992 bytes
  6 files changed, 5 insertions(+), 5 deletions(-)
