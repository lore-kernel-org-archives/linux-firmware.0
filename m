Return-Path: <SRS0=JzFj=DL=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F437CD4851
	for <linux-firmware@archiver.kernel.org>; Thu, 14 May 2026 07:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52D0DC2BCC6; Thu, 14 May 2026 07:14:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C831C2BCB7
	for <linux-firmware@kernel.org>; Thu, 14 May 2026 07:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C831C2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E35LI81096444
	for <linux-firmware@kernel.org>; Thu, 14 May 2026 07:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mnJhECtFY1gNrFEk9myGf8
	0qLtbBLJRKmN5bXUYlY1Q=; b=asJBOMGq7CFeH1/L30yUtp388wSDORfYEkiY3e
	yn4GcjR/FVabJyEdXWU1d5jdP6+fXWQtDH4byi4d3qYI/iieRudJ2GJUP4fyJfCz
	JZx/tg1pcMYmaPo0XvNNklKyeTSlKWB5pqfzRcCaSODEtwB8bMfRDFcRp+mgmiNl
	exToWiuWceOhccd7+e8c2lMmUmdTKA4Ze/9G/EUKblt6qGwmgOr9zpUdZnBC6+xJ
	GBKgk9M2Ztm+lM8/YxEw9yK174UEjAlIL9ca9uHywaOFq0kCQ1FNKpk0vMyDtM17
	p3x53UVhCwgWiZg5/aXc8Krp8eqzrAs8KxodkHOI1Bky07uw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bgq5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 14 May 2026 07:14:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8294d8c48eso2583243a12.0
        for <linux-firmware@kernel.org>; Thu, 14 May 2026 00:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778742845; x=1779347645; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnJhECtFY1gNrFEk9myGf80qLtbBLJRKmN5bXUYlY1Q=;
        b=UVfyqvzEkzpulad4ATi31projPup6R+C91/TsWzGGS56h/33lwbTm8L8tDLwXUnSVV
         pvReFoXMD2cIChTyqszUiIZhgBnGjQ0RT5yTFF2ntfsHs6lT9zVWhvoGOtLpFS4ovTYj
         SJSpKg4NnKzuAXO6ytJf3H4hHfnD1XEzM1ie46ZqmYqK5ovpKwaIngbrWUfw1LpASe0g
         /VFn6PaxTBVUrwMmWJXP15tDI3R24E3LenhyDq+mYDKpSp7EOqQ5IWp7xklGI08GLJ1/
         CkOQnQSzyjp4QtfM8VkFcYvElPVE9e0e/pSA3oPCO9TKCOft6qv2Kw+rxAzqQFebkb62
         zTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778742845; x=1779347645;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnJhECtFY1gNrFEk9myGf80qLtbBLJRKmN5bXUYlY1Q=;
        b=BQyRXyNDCUkRyJRJcCoomaYsO5WkSK7W0nqJPlEuGwPRBVujKzbhwy4rh73Qz8g0TY
         +7S/06hEJXJQTS18tfPnDXwa3LO9X6IXbM6r2Ua97kGkQVmUwh77ndZEeppLJqcDPzkU
         WrSVxApAjWnBukgmsFLYoWSxrOWf1SE6u47G54YGRRtD01nnwvWbwNdPhApHn9y8OHyo
         7OTZpauvJbVMazK2ma9yvN8woY4ueNDlCUQXhyok5qBBKkI+ggioJhkfGIHCva5IenMX
         51Ac23fvtPa88tKTDRz0JzcAxcykK11/m9cr2ZYcPZ76bdOgCSOLhQPx/SLkC6J4YefU
         oPnw==
X-Forwarded-Encrypted: i=1; AFNElJ8yYP4MOH0L4H6VLTEcxEyhle68dUH70q5K1aAlsbHjtUfH9TsvwMtLqoJ7cDfgPhsLXUAuw9gieE8pHL4NkQ==@kernel.org
X-Gm-Message-State: AOJu0YwjHwDAJylYwSeQ/OnYzdsP4zxymhk6lKlQQftYN9ci2gdCfE2H
	D8dkczx/YSU34m8GaHxuPcy++D+NZ4ydbHUNTMYPINx47snnK6akvzQ/GpCIOggF0d+ZWiNHRNv
	5vW8TD81kuh2SPB4HRQNQUlkbiTBJtcVwNrBphoirbvQB1VAfPxCe9S+4rje5VTw=
X-Gm-Gg: Acq92OEr4kqyjPo8R9IR9NuWH5o0Z7Bd41zTl4bisWGktzTcw3i1/uHWG7D2D2coFeg
	Pks8syeLb4TM5JDZby+arQI62CFFUjgaVjOkScDqWENXvVQKfdgsWv9vMkYctwt8C+J/EUO2jHH
	iZ87mOSPwtwcRViS2erwDoaHi1Qrg1Qk9h+EhLTxudXOQoINFJwYRfRurN+TfvJZ9pdWKvOfax6
	UQhQ+Mvly7a++19oHqwee/h34oCi7iYAXZSzjzpomJr/f8BPmYCRcg3oQsdL2XpCxn8U5lZzY0p
	wxypyFc4OJzn0HSVdSeGvrXaeYQfxSvHEUTrInjeSibwcq4slbjSS8tv5jVu1tFhxwhubZzUphf
	Av3rV+TBI0IH+Qkq0Cs9x8PCIj0ai/5TGTFi5wWg6cmzjnBq3TA==
X-Received: by 2002:a05:6a00:194b:b0:838:1c02:2763 with SMTP id d2e1a72fcca58-83f03e94411mr6697787b3a.9.1778742845081;
        Thu, 14 May 2026 00:14:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:194b:b0:838:1c02:2763 with SMTP id d2e1a72fcca58-83f03e94411mr6697763b3a.9.1778742844585;
        Thu, 14 May 2026 00:14:04 -0700 (PDT)
Received: from [10.204.86.67] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f61e5dsm1644419b3a.51.2026.05.14.00.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 00:14:04 -0700 (PDT)
Message-ID: <bbf9ee62-dee8-4de0-a85a-3578cd2e80b3@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:44:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP firmware for x1e80100 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h0ejDST-97FGSVWmbDigBrsEBxW9PH-F
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05763e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=eUbUixF0Y7wE_pw-hIsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2OSBTYWx0ZWRfX8ohIgAOPnga5
 F1wz3y7m7qTJElOA8q9Z2gb++sgz+uOYoeGbvZqV6AyjlcwlG2xf+Ho4PDBtM7xy74re1zLeNee
 L0bcunFjgfS4mvY2pB3l/QgNkA6fLfnybTqST3HSYRb6++ByTd8yrNhDRqhgeBEkTxkKzpkuynE
 WMF7JdtGUAQdHLGfZc2GSbeKaYtYYIZQf5VZ85PZnyFYxJnM3b9oVdwQntI3edT0CWzXjxVzaKI
 OPBmAHYyEcDc99kD9OyP081LzLUQBvsUISXMGz3UEU93ya61veiXlT9Y5CctQhIQMmwp6dkP7+L
 k1vUFde1esaP6cR2LQ7+9YrP/CSLr9uTBsclKmnwAsiE1rJny46iGkTh0mJ/CR1z9sbDEVOoK5C
 e7JI+9ZBysl3ZujYDuLwUVbQTcWnTZEEA7VQztD8zMDerwlVbcQ4q/L/rNvumHN8q/aD4fUSimi
 Uw3QJKZB0Eqc1MADofQ==
X-Proofpoint-GUID: h0ejDST-97FGSVWmbDigBrsEBxW9PH-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140069

The following changes since commit b3ed53e0cb528221d9e21b7842846c3ae3db7512:

   Merge branch 'lontium' into 'main' (2026-05-13 14:21:24 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-hamoaadsp839

for you to fetch changes up to 321c5c3195b8f2d39db1687186191ed099c16677:

   qcom: update ADSP firmware for x1e80100 platform (2026-05-14 12:40:13 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP firmware for x1e80100 platform

  WHENCE                     |   2 +-
  qcom/x1e80100/adsp.mbn     | Bin 17922440 -> 17922440 bytes
  qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
