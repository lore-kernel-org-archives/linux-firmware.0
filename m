Return-Path: <SRS0=Tc6e=35=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C9BCAC597
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 06:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA096C4CEF0; Thu, 18 Sep 2025 06:39:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1040C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 06:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1040C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3HWTi010820
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 06:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rv1AJFMTZjsutB8I8htEWC
	LvcO+2kwetBDogKN3nir4=; b=Y7QR9ARxuwYnH0+NZ4K+JKzu0wULXZtwmNZPoc
	r6yXAyrktNONgVJlbWJOm0WNucJk7R5OPNKd1QxIuSPV/Jes9TS5PJ5/EhkdfWKp
	TH8ka2GExfaO4VZ0KPHU9tp6L8Pb4xPCHsXP6N/hxUak/qsFHzURpBXPetfnbbwF
	NBheGogsvFYOqNv8QT5tBmSAUKqUUnq8ZtqmRB8GNE+mBEGNjTS5hgsQ/nm97fpa
	dZ0rSZ+MlTGWyXrWQKODmSgr0Xa1FPcjAfWi8eAO89RMq4kKvtquwXvwEulECWMG
	KHb7rt2sJeMKqm2VtrecaiOZGRzHzArrkADEIiGK5a3CWSsg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxw7ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 06:39:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so586113a91.3
        for <linux-firmware@kernel.org>; Wed, 17 Sep 2025 23:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758177577; x=1758782377;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rv1AJFMTZjsutB8I8htEWCLvcO+2kwetBDogKN3nir4=;
        b=kWqwHgnQ4TeS22VrZIcyWKZCy9jmq09uKZ/x0+lylrImqGDza8fen/ZSeA/GrpLePk
         W42JKImWbOg8XSFXbqDI3/mnmeUevpZJC4GxBE2WCmSzTQrRsxR6Or9IXWuLnk5eaWil
         6zSud7t9YaPE1YzNREmLjSuSbh3j4f/zVqXLvL9N318uNSymf8hoq8ogzzL1rlk0Cp3J
         mP1zsfQCOu9weW1NzR0JudVxxOVeP+vdjpkkjBzHsD+guAKuwRd8833vqwA+knWqVHd+
         YmwOeEGZQNYzEhDoEWFM1kf6umMm0zVRot4pj6Cx2X0flECqOev/67TV0Kv7apqp0ule
         QTwg==
X-Gm-Message-State: AOJu0Yy4ebMAm1nAUoA2ano7eNQ7bPoRTn9xN9cnCIHU0jSwbhP7PWCK
	0kW1eDnJTYftQAnUxAHKVIOvi5Hyw4Wu2d7vCRf4+mqtdr90yaxPZRKA3o/mbgdtyWuAfZxKUxx
	isxWd2KfQCO7QsA9jgRW6JgM783pXcCG33OtG1m9XD+o7kfCeNuQ9F2USKk208rFIev0+iqHFBw
	==
X-Gm-Gg: ASbGncs8UB97TZhAX0kCEBkZ1SyBFspOmpyeWYsTHSNFaWsBe2tdzmT7fJ6Sqg+sRCt
	BWPYQjyAeQH/fxskoJmCvdKwY7qopuEph7W2U1NXyEmWsIWHLBAPlysqrhZLWU9CAI3K9/wpUNU
	DNx4YX/lcfRC2X4wVCSeaZ8rEjR8kW5qCJ8wBn/+4iHN6Tp/lLPMnW1NG7V0HVqmh8vjl5kUC3m
	Tr3Ydk/1tPLDs+5N4pjs9pB7xSh0+FGOM5SB8BdjOAjKgGhRw4yIIZxnwcwjR6dm1tZEZ9lpq3V
	Cr/XC/AqoRNZOX4rVG0kUTJvE/XljPLUORcGCziHYQY2Pf+pYZctL9mMqQlvl/8l3ZCN
X-Received: by 2002:a17:90b:2e8c:b0:330:48d1:f90a with SMTP id 98e67ed59e1d1-33048d1fbd2mr4287251a91.27.1758177576565;
        Wed, 17 Sep 2025 23:39:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnAxBUdEL9s1/cFtTUfrlOrT6spvKpXz+6hDAg3g/BEo36r/s/IVOEaDzXlbDiaIg0jDAn7A==
X-Received: by 2002:a17:90b:2e8c:b0:330:48d1:f90a with SMTP id 98e67ed59e1d1-33048d1fbd2mr4287232a91.27.1758177576143;
        Wed, 17 Sep 2025 23:39:36 -0700 (PDT)
Received: from [10.204.86.37] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed268760csm4358787a91.6.2025.09.17.23.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 23:39:35 -0700 (PDT)
Message-ID: <fa431a1e-75a9-4c89-b790-81368f30733b@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:09:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, ekansh.gupta@oss.qualcomm.com,
        bkumar@qti.qualcomm.com, kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXz+gsNVs5JEv3
 lza5VJLhopteUqsjdBh2fb2p02nc3j6sNNThrCm9mnQ53eRBL/CpDsCXPSc3iGrjYAEN3lW1XuL
 X11m/xr9/aR5tDQ1Hpgwd4L9WZTYVg3k8HiGaLnEq2mn+TrMOvtBgW1Xu6XQB+ILaN4hao3gwQ0
 f+PQ83kuqlsuF/NgeXMmb+VZS54z7WQ3X05kDByhWf7A5ClJv35NOkBUnPfsgz7uO31MV4NsKAY
 7Y0Y2immpW2YJsvDiDtcrdf2R5XV2XVYZQq9aPs8cG2aglJylpyYBq8f10sOfgginwXW/OtzO8M
 rAYLj2o9BztqzBbGh5FBBqxqflLkm1Zj00vjM9C8LTA3nkSoavJzORVGcw2RpN6I+MHxmRATe//
 hTz5EYnC
X-Proofpoint-ORIG-GUID: uxYadSM1AWegQ489ztFDNozxHLupjg-f
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cba929 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=wKGTahcfOsQ4PjogmfQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: uxYadSM1AWegQ489ztFDNozxHLupjg-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

   Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-qcs8300_1

for you to fetch changes up to 36da01bec9809f7bd96594db4885a86c286e90a9:

   qcom: Update DSP firmware for QCS8300 platform (2025-09-18 11:49:22 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for QCS8300 platform

  WHENCE                   |   9 ++++++---
  qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
  qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
  qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
  qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
  qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
  6 files changed, 57 insertions(+), 3 deletions(-)
  create mode 100644 qcom/qcs8300/gpdspr.jsn
  create mode 100644 qcom/qcs8300/gpdspua.jsn
