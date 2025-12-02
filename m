Return-Path: <SRS0=heNF=6I=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E567D12668
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Dec 2025 18:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 187EDC16AAE; Tue,  2 Dec 2025 18:06:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C994C116D0
	for <linux-firmware@kernel.org>; Tue,  2 Dec 2025 18:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C994C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2DjNwB2821359
	for <linux-firmware@kernel.org>; Tue, 2 Dec 2025 18:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sdAs0dnDIogQLGWCHgQe2H
	rkUPtRZeYZMCUBii0siA8=; b=DZ/W2OoGO+EwpgHVbDwKw1ewM8mFMu0Od7VBIg
	h4SVSP56eUYfq3Cm80ql0MZ+wjt7shMnC3aDAVq96OO79jwAID2ZpXPTZkrpF9oC
	gr+6OJvBeRUDYeqSaG27bNbgrZ/xBMgAMQqFTFZMNJDer6KvSZc783+9b63PIpif
	M9nplnu9Gy5YeeuKiVTWx37gemCmQ8XszFwyqip4HjV0GIYSxDtuQpv+d7PQPbDy
	hjjOsRC7gOmklFxwMbYjbysBl2E6a5jUouAT75LUeIFeo/NjH8WGVB78oS22jEl/
	EdEbEveYeoxwmt/4sl6Yk4EeLd18Uw61T0zckMA61KWQRnBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4astjgj9fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Dec 2025 18:06:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34378c914b4so10850444a91.1
        for <linux-firmware@kernel.org>; Tue, 02 Dec 2025 10:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764698789; x=1765303589; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=;
        b=bszsKffmTodONDEWNmAxZ5yhj72H83ynSLHHQWJ482qQZQ8rOkQ7j6mOLcci+wiy4r
         p/0KEkm2whzHwDxuRCwQYN/Utls92+5qsZve/b9SIDdYZWS9IIRqyJO5iL57xqOdry6M
         DNrt4xilzcs8ZXWBa/GqPES5xNPKDFaqCdk2qrNeId7EvaWb+PTPUu5/qSH+ppKwqNlc
         Z1IQwaYGDtljnJRDt7T79+mcjYjTlRfQRfuE03UTqX67amvWa8TZaM8PIx5mEFUUz/2W
         Oq2qOH58tHhnKOc+LJPZc8oYlbXAwDgsliieTGY8JifQu68VmfLZ/8SCMCvR9qPXKJlv
         axfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764698789; x=1765303589;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=;
        b=nSsMshRRH5eABZ9ZdzDuCjI1t1+rL7UFIXv/fbvwTGB1itVKFW8uZNDRu3WWFe2YDB
         Ed/9P0DCmSasKobkw/Es9DMV/KqcImLc2plqD56oVvOYcJqycW18jw053gAn/2v2bsTV
         WRbqJtVt1q5BaUlWzw6iwZKo+J6/+np2sa/Pjv9zywkjd1RfbA29RdPOB18Sh2Iqrd+v
         g+Qy0TK7dB31uIDb2ADFrzMwTAQyrqCcc4KtlS1MmGZBLhiMwzj/QOf05Jm4dob2kCJG
         Sp4NdS9k5wLf5en4IkEKykSUaqAZewHqcsrtjeD0cPlVxbU8RlNWg5X3nz6b2xacQiaz
         wXQg==
X-Gm-Message-State: AOJu0Yx4Vq6WvFI3hx2qV8TcG1Yshk0Wvk2oHAJfSvfK1QiGCTwJTsp0
	ZjNj6TBHKoIPCbi1ydN5peHakEPjnLLVtUm1F9jb/QX+pUhAY9gVWnwFiF+DzUe7JnHpn3EdqEM
	0zVeN9nCz+K7uTW/D5sTuYA1ezw+po71WE1g4EhEdilCsFcpiwgDhbKT6xLpUmGrFmJQS9AA=
X-Gm-Gg: ASbGnctGDwb6oO/OZ+Lh+putIB0JopIJPCoCe3xJMJp0X7ftiD/CWD+R35u9l8orbX2
	o3jLCQDNRbWa6ZEcJ0/jFXjH/BaR9+t+AuIkARhhh/Ac9qnLk1cobWUNr0nKsk9sJsI5gPXY7gu
	y4JF4xB6Ecym4+YX1PsxYIrQTyPBFe0H/V8ce8XjigAKK0UfQaXw0nzyczIDFAJMQGtu9XQG7YB
	kj+Inf4EadCpPrarARav0O+HpMy7VTXrBYpRb34Ur46ghb/IQHdmG2dGSRGUHS5bvdTHmlqSIup
	2xJWIv1Kg/ctL4TzDWoh1CThbQfVxOhBUi4kR1i/lhmjYAFYRbNZDlj0oWcpg+PNgdprRovazq0
	XgkuZP87BaAMFghx8FTlkaHkKXssxnlV+TR9+8JqYGne4DQ==
X-Received: by 2002:a17:90b:4b45:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34910775f8fmr259208a91.3.1764698788543;
        Tue, 02 Dec 2025 10:06:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd6+xbf2z4wsfu3GDzVS/La6L3U61jv3f7dxujiiHLeJ95eqqcLPHTONyg4VyfeA2+arbvgg==
X-Received: by 2002:a17:90b:4b45:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34910775f8fmr259180a91.3.1764698788018;
        Tue, 02 Dec 2025 10:06:28 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910e9dadesm41153a91.13.2025.12.02.10.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 10:06:27 -0800 (PST)
Message-ID: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:05:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20251202
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E7Kx3cG2saFgwvlyhnA4e0YAXxCUt-yt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE0NCBTYWx0ZWRfX7qIM5UjnyZ4j
 r7//8Q8IT+DGDcVzSgfCQCXMquFRaXbM4PaQPhlN5fZsuOuO4FYjJpt9xV95V1L5wfWB6xis/e3
 zDYGXSOwZ//DUnE8d++wnDor2lkKKnLr/RqMqX3LP0AAOObn84D9zcKnzHz6cu4FE1jYFYzXELW
 +xWQafA7U11h5qKN0vigarQNXqdgfl9BjNxWdFIz48mD/L8/DNCVSTbgxwYkCMBaH7PQxJr9oR6
 LCQpFXa5s6svF9hGq1R9PMAvYmesJFzn6qu10KZ3VR0ak3/8n0uWKY/ZCiQJ/lEGNZaaQHzekuq
 IA/d9qtGh1stwRVcuacRF7f+1RtEm5uHMq/V1PTJIJ83x4qGuRqsvPlBm2kvS4pk8U0UOfZc8+K
 UBokV+gadqLG4f1Ek5CbadY+eI2CZg==
X-Proofpoint-GUID: E7Kx3cG2saFgwvlyhnA4e0YAXxCUt-yt
X-Authority-Analysis: v=2.4 cv=EbfFgfmC c=1 sm=1 tr=0 ts=692f2aa5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rMWBp-HL3mJ3BiuJKzMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020144

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

Only ath11k is included this cycle.

Update the board file for two QCA2066 platforms, and update the firmware for
QCA6698AQ to enable CSI/CFR reporting functionality for IOT products.

Please let me know if there are any problems.

Thanks,
/jeff


The following changes since commit 38c82f07a964e27c3e71224c1f038a4083ff58b0:

  Merge branch 'robot/pr-0-1764573234' into 'main' (2025-12-02 00:54:05 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251202

for you to fetch changes up to 15f8543684412387ebfc97a4b99ecd18afdc5e0c:

  ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-12-02 09:53:54 -0800)

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                           |   2 +-
 ath11k/QCA2066/hw2.1/board-2.bin | Bin 745408 -> 745440 bytes
 ath11k/QCA6698AQ/hw2.1/amss.bin  | Bin 5005312 -> 5083136 bytes
 ath11k/QCA6698AQ/hw2.1/m3.bin    | Bin 266684 -> 266684 bytes
 4 files changed, 1 insertion(+), 1 deletion(-)
