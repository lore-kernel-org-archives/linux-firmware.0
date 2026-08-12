Return-Path: <SRS0=e0OH=GF=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF49CC5B572
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Aug 2026 17:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9D331F00A3A; Wed, 12 Aug 2026 17:44:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786556649;
	b=cV6palLhY7w9a8CuuuiPgc8D8tjVWkFn1CLc92Rnc/fhA4ZveK32MrowKaBuBt4ReHrZ
	 EiDm+nHZI9P7YUKS3tJo/B63xSPm9M3BwAx1D1QL65Kffh9foySEny2Y3wh898jcRW+1e
	 Zq60ajXYQ7tcweZM00r++t5KE2Osg6fCG80j8RmbVwqD088WV59fAGWDFKNJwwwofRFSf
	 cJ3yekD/8u23XwTM36GXWKnEkkA1FlafyogMcKkxddzICC6VwMe7fVYNhmWmyO42GOYnI
	 XKAZ2qfgkAM6S+6s0iPhQL1PONKlWHMSlSXhheB0TKusUKlVRKHXCEv6RqpqGZDrn3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786556649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
	b=X9xb5PtO8r4k0YxiMBKTpvQV9e5mjx/KNNRolT+zioJBtIeCW0XH/Vl1NDddd8Mhv0Co
	 BjH5s9LrJt35/zgOz91yC6dwsH7Xb5cUiRmSGlyIfdhQ1b5xOmNaOZBi+PKhlE825GpvF
	 c+IKy8I5xAcg6BOgqwl1C7DqiiVpOuWT/8KbGYt09KI3+l5z3RWbolX+rQXxP2Yo6Dhb7
	 I8eF1br8m2BO8F499jHmLQ/QL+NxrouywmFP8L6rVx9pOnUL1A98TKEtG1QOZjMSOv+GR
	 ayyUKEQdhZY08Ac61UTWpf0Y5a/flLTKfgEO2gngRF5wXdQOhNh02ruEgnRuG1+r4DQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bmyaQwom;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LuOwdroS;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C3191F000E9
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 17:44:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bmyaQwom;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LuOwdroS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0C3191F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CGqHPZ111372
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 17:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WPrUe1AHxk8839bSM8P8eF
	DTJ+/fnhI9uw2/dmjlgD4=; b=bmyaQwomX0028YIjqP24MgJYMgs88YwzsbdR2u
	+T7RI7MyNpTaNDbpHDSTcNimEmT5jUBZIKm6A8RznJU6gn5Xt1qgUVkm7etEK1ol
	eG6vKMv9gQ/WKdb9BDI6HQwq0OxMSC5anSpaI1olVLYhu/fgcYaLWM7xlfe/mFHH
	qf33+xWrsYM2meKe8wnuyQSnmCS0SzzAHTZEWW4ZBjiqTorwh4Xpm4c2wMAviDaf
	Pc7VBegBx4ffmE+JxRe4IxjIv9SbALVkyLsGhccYuntk0Fx+aTmwIgC3YzrADn9J
	jgTp4aUvglL6kwEK9qC6cGmlXmEVwypjFRpq4eKd1ZK5JQig==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1kctf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 17:44:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8485d853b08so1733012b3a.1
        for <linux-firmware@kernel.org>; Wed, 12 Aug 2026 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786556647; x=1787161447; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
        b=LuOwdroSfSfqNzg/X942WVrsFjx/zs3USGLOZ5J1yf7gEGNooqWESwtjlLrxwZq3d6
         5Q7oFc5LLkXat2K2ujhEOfNNDs/TQm3kcLPWOdnChdbVBEVJom28e1ZxuujSOO01aPMN
         oj3th91Bsyy/k7fCO9h9mVzRVfkC+GGCWmduz2xBkKrLDvbhQSTqKbY3tLDb8eSo811C
         G8/553Opjrseiz55Ndj65phjxZIvh4DCx8+ThlSSKdFDLg9uieZOlmP+2i9b9KHguJvT
         ENAB+6F/BhqCkILAlyRstj0w+xvksnNOIAT852Su76lbpnNKCel6E5yDosuerxPKH6Kb
         a5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786556647; x=1787161447;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
        b=g7PnQCK2DVdM/aFdahsF4D1bbY7ySoXniSHCgZQ+aF4PokaThKxLcr9Y4c22HQQbPL
         IyOuj58UgodlLP1I0k730AV81cILdnKEWTnvKcogkIhwNeY4fWvBsS6nt4o2cVQ+IN5R
         ZkrbaxajDxCUlyY5PEwNQe6/ydBYT+wLI95as41h6sv15bHp1VHuEETZXLWw2jWv9Hl3
         G9+ervAbBhKVGPBwoqPEd0V8EDQuXEADR60mPK5cKThhZdS0y0jZLnNDZnKQ5qlEnfWO
         9Z8GcUIpgS+3e0GgSPEcsBZEDUNJoQd070X6cVKl+YLuAJcMngZz4STr/tJa4l6PSl+1
         6lDw==
X-Gm-Message-State: AOJu0YwNmHHcoBQ/gER9zl5s+WsUWcTM35Dy7tjwK1+//jTi17QW7UcL
	rtg+IzzPEzA0TaGn1rtqmDNg6EhKmF7QIybFVO1hrMg0li04D42BYn4vz+WteZymty4TsENNWzk
	036Ew3mvjMgPjOoyKNzw6Ku3uHYsTqzFVwp116wEzTV7Oyas5A/Vyo1OAzw0fQ9Kco2bqjvw=
X-Gm-Gg: AR+sD11w/zRXtG8sWGyEM42vdu2ou9ddFfgAJ02U1pWVYSxIWByYl3bJhBbQOY78fL6
	eh1WwNLui1VEu2KgXV7sUyHaWBd5NPnqoqT6rgBQzGxyIDou8xUTqFoD5FLVMbsINSnky1qluGa
	cyYXR+me2Gc7udrKOi74jf0UFsWv5RUtKkI+/4lYQ9kOd88jQrVZxpT2CsDVXwg6up/Vbz7uHEc
	eTY2nHXOrDLcZICZ9bKiEsUhnL3QsYrKtZObqkNEdcBRk+bwYaEZiI8B4LfHWZ7ZIBDZRUt6n1R
	xSyxfbHlHV3O7GAJCfOcVpuXaMyJqkh5OdgvF6HRmkbWv5SF6A5/aaGo6AcJuSdnZlY5QsIs3bf
	5OFbamrSg0AM9Yszl8F2ANnjFSGqoWnkwdHhw
X-Received: by 2002:a05:6a21:a4c2:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc553e6c70mr93764637.35.1786556646814;
        Wed, 12 Aug 2026 10:44:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:a4c2:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc553e6c70mr93709637.35.1786556646396;
        Wed, 12 Aug 2026 10:44:06 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31e65ffc056sm966106eec.27.2026.08.12.10.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 10:44:05 -0700 (PDT)
Message-ID: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:44:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260812
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9cjNNKbgBT_6JVzMuUn0uUM3QXpRfwyc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfX/N8X0FTruF4f
 Ld5Wh/PC009/jUwRTQzeSxVquqoWIWlkg8jCOB105cD4owBEfAZFOHnHcmovIamoA+5bizyXztO
 X5cy8XLrLHfr5mO60G5eANTE/e2yeFu7IgfE8JniqwdbJMM4M+E7tJK8UoVdEqhmKbx+B7swMiW
 zE68ztMfcwVvz9M+0jX9LXzOT2xmRjtc8VlIX3iT7nZbJpEDw+KOS7OGCto2vMVPe3Zmt4GonAm
 C568t+d/NBVFoe1SvowwzJJ2s1tbLMVKsmcu8mSOl4I44Hw/x1xspcuz/aoO52h37Uqdva1tukZ
 HnYMNiatecW70ziz1rMnJ3Ys1FcAv3cMncK/wVsr6oOLsI2sh6zFqtfk4ti6EeyxiWMeSuxtoDz
 ur9XGEYypM40QEaHFGjyYOExif1TiWVb/nzMhlV6xT++ZFXDGz9AJ8eXnJQwTmRXkt22UF3weHr
 ZxH66GzcJ8jtOkwj+6g==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7cb0e7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=-bKND4alXjPcxD5Ql1gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 9cjNNKbgBT_6JVzMuUn0uUM3QXpRfwyc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfX6OvX7WlUpbBq
 DftcXMTvyyxWSPVyivR2Srzw/5V0lbk+AKVcXlBRVDYys0g24P0+7KBjkNbdcqqYFwo37OgfW1F
 ikGyKeaU2kRe5QXUx4D2gFXL2j/1m00=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120142

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.

For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:

  Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260812

for you to fetch changes up to 25c06030aa434817928ace452c06f095f14729d3:

  ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1 (2026-08-12 10:31:06 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1

 WHENCE                              |   2 +-
 ath12k/QCC2072/hw1.0/firmware-2.bin | Bin 7111860 -> 7148724 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
