Return-Path: <SRS0=GJif=G7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A261BC79F89
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 11:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7941F1F00A3D; Mon,  7 Sep 2026 11:59:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788782386;
	b=pUsK++QOn+Pj7lizSVOdT8gvGZURTbPp9lIbBYuYsj+h82nynYwHF5eSgy37NMExdLgY
	 xpPX8Xeha1Q33agT+XE9KXdy5cOgoQ5KcxanyfVMc/PqrFv0aQLHAag1yVxAkBr7iBRtA
	 E1IO5/WI9sNPMLNEgrmu5AgqM6sClCkJEOEvdnkyObA8sL7H94zhlDqesmQiQvP62Xe6a
	 vg5AcNFMfnY2oK9wAYqhtKb8yJmPBKvRZkvq7f1dBwDjounyUKg9jWI1GVxC7UYnHXRQx
	 aqUdB8VX1Y8BFHfN0YE7Veni0NUZFkBGgI1BQrQLb8bWLxa717eOPTGFuJDmjp3jYJA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788782386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Op0Q69m4+rvgLtmq9eO9qNiad9NouEaf2NzIhiHEHMw=;
	b=ZVyMx8v6jLRLSgOJ4DQml0FhTB0SQLN3e8RcfOI857dV4eSfeiu1dZYMaQzg+HXIG1Tb
	 b4on2jl5u1a0bI0fGMYOHvnPZrJyEdhqybmY/RemitrTNXLZsd5+l8sa+VgjVOCfDRhWh
	 7Cs5WAiTHb5ZxZjLnZ3t7R0QMQRcMzPkWtWu2EiTOSGcNyQOAi2Ku2dFymMMgKx9d2B+R
	 ljF+DEbe9sPZesd9pABLgSENjCzOd0Cg+fj4N9OQhXDYACNKUEsYusxtiZsCGC0CaJRGH
	 e0y4voEzyqybY9C/tlsTX61t/1rxJFxm/CvEgGDXHvn0cMSh75YI+e+B6DnY2PJt37Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="inwhY5/M";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KnQBO3Ly;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C949F1F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 11:59:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=inwhY5/M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KnQBO3Ly
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C949F1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An3vq3230482
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 11:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Op0Q69m4+rvgLtmq9eO9qNia
	d9NouEaf2NzIhiHEHMw=; b=inwhY5/McFCclJAVYPK8MsHx/yQd4eG2HDB5/m5Q
	XbIWVf66+nwLBNxrKx9vilkxsueDkGsIRArElH4ZZg6uusone7/9obEkgV/Qlx7+
	lHSpLmMgdlKbVQecoIh9mfO8uJS/khYVlrt1Dhe1kHUS+aO6/GFuoyYlZyDAunfR
	THbnUG63y/AW1N+nd3oGhOEIaHtKQETD8GZa9aDxyLtm+qiGRhhiMANrGC2QhoCM
	BzkBvp0WtS3uegMtPm0bwe4igMikPca3AqnrVayUha4pqm13/prRl4x0KNrveuE1
	njE9n+xsVvlhyspkezdkAF0kyTEbdHRDyryvsK14xJPXXA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxktjq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 11:59:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-74748e3a5b6so3876664137.1
        for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 04:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782384; x=1789387184; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Op0Q69m4+rvgLtmq9eO9qNiad9NouEaf2NzIhiHEHMw=;
        b=KnQBO3LyEuC1l1T0NuLCrxIgaY+0UyKZ8yh2U8ZcYQhPUqMzPumUexZkO8z4dymJ3P
         a2iFB+eBe33e0RwBtwkQuus+tyBcQQFj8bNH+M6oN0Ju8rJDo8kw/lwRbFu/CseH86Dn
         wJK6ngwthDrsQQMxdPDl90qRK1ht6qrz8ad1s9uEhtcvOnWa1MbcHgwAAZ9E2q57Wjs/
         fJkn8M+PLhrA3s9ykYA091rEBBcUzlxsPKj2cjaW3wc1n5kGJ5A8jSVUAMovZe+dAir4
         xZnB6ofMZDD/F7BqfHHQOWY9TmCfjKlOG27oHhIV1L6gHOFIRhukzWqNO1jcbVpFSJwf
         kjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782384; x=1789387184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Op0Q69m4+rvgLtmq9eO9qNiad9NouEaf2NzIhiHEHMw=;
        b=rCZoVm53a+mQ5Qvq/xxxR5Bm5u0VSbcTwz29z3EfKFH8+br3qJa1ePetzu6Sbnb2yg
         qkusBoKyl/g2zXlX/6vRGcSxxX/T8yjHxu5xucHg1GQf9HdXgXZsaeZ8mb3QrRap7XDL
         YrGakrFyWiHpDxMdA3zXYZSmpBH0ZJ1JUnRQK7xSfQ9zLudTKK+ttrRI8VeEGhHvrBTH
         uKQVeKXb7/HHmzXxod4z574XyVOTJ5axy3xefOw2pliFdR1zZl5VJ1gFcwM66mGpg0Hl
         hmy2Z0Q5gNoFuHENFUSxyA2Zuw0A8MBcrV+BF9odl1CNM8H9VqMqWmM7bAIyhPnHPx8r
         TpvQ==
X-Gm-Message-State: AFuF++kh+D6U0WM+aphboGqc95+NY0dnh4/kF6tl/Uf9c5sdITLooIBf
	KcwFREU8g+/zeFrNZTE1uzA2CLl6KOs9RVS/gG+8ipJCCB6FjWwllKhL55CLriSWgFaF+4Crec7
	VX965X9AQGh4aMnFER4NDpe35vl0uYvDp0pvr4yYyp2UvsyFPZIkBkgW74grQhiQ=
X-Gm-Gg: AYBFou1i3BNIJnrvuZk36khubiN5+U30jkS3oscXwh55Kjp6slmcanOQhSAswIsprwp
	n6E+jbjr+F6FFzA4ogdCL+RMHKDLkHwbEyFORdPLWPnz4137dGeNbNbS/H0MlwS72BsY5Ss8cCa
	9jE+XEDhosggMvfIDhbSaYhGTB7MYhJSyTjNiKalL9rBd9k3hSEZ1qmLt6RGmP1fBhOjGkGbZrh
	ys8HHo5wri1nLW7mXMUxURJN3QNhYKIrVbcY7dpTAtJbg6M6Mt3SKkOReH+7Wl2gtxoF5iy2xAP
	0vSPA1awlQkfNsbjjWW/1oN9yH38wdTXIWBDgHYL6h/TWOnGSEnfgQRKXGMB75WsEUbckvVZ+XQ
	NEdRFjdtmXnJLaZa8eSyctSEMWZycfv2seqzCEF68neHCQffXYez0z26SYVAqFX1SKQxm8w+oZ3
	OjrwpcjTcZ30KZ
X-Received: by 2002:a05:6102:6495:10b0:734:54fa:971d with SMTP id ada2fe7eead31-78a2ee06a31mr5415019137.7.1788782384151;
        Mon, 07 Sep 2026 04:59:44 -0700 (PDT)
X-Received: by 2002:a05:6102:6495:10b0:734:54fa:971d with SMTP id ada2fe7eead31-78a2ee06a31mr5415013137.7.1788782383691;
        Mon, 07 Sep 2026 04:59:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b667b6c954sm1928303e87.12.2026.09.07.04.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:59:42 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:59:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: Update ADSP firmware for qcs8300 platform
Message-ID: <wnsl2r4wkf5yhtxwwfethkszj3oxjkumcsal5czkztsei3cohg@frldhrx2wt4h>
References: <a17c7a59-0711-44d1-997e-8973c4849590@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a17c7a59-0711-44d1-997e-8973c4849590@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMiBTYWx0ZWRfX+gIqQcGuuJuF
 xtrLIhU4xcaEf+P/cYxB6t3356YIvcqi7kEUB/wJ2F4o6u7+L476oakIYEpOfxj2weTH8x9eAS4
 Tx/HLMpi7bF9knRjjgwLFLqK7C1zQUM5CdEAXOTmOdvzd6NFsdfS3kJ2MdRiAYDnWza3RqTa07a
 26KgSFYO0diU1ukYp5DUE6tmuhKWIqTOcQvrceaDxgCTUkdDRbTU0/iCMI13KN5HQ4txK500LTM
 DE2+ZB5ZaKe224gvDl3OUZBVqsjUOK1GYtJXJ6YQBkSOMwQ4z2BpV+19VxkuxrRLIZERHhOeIUw
 4ueJK4rvtFWtd+V+xxsqViPSUgFj4E9Ch7YYLGzwrFy6NueTL0nXEj5eghcFncgOWADNRrqKewe
 DBEvX+zLOORgu4/TEEkIdYWW3OKPS92cI/H2o5Nm+ser1Hj9+ZKDjLWCBr7JsIdV8YxWUjv81WA
 Zc0kh59vGkFkOOTe2fw==
X-Proofpoint-GUID: Z--kMSdn1Su7Dz2bHxQoZbuhR-Isk7Ik
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMiBTYWx0ZWRfXy4ZGqif36gPD
 mFAbaBgtkcpz6GFz2ly3lTjwTuCMl3XmF9HL+Bc6iJnR/bC5lhCbYvr9R6WGLkMJOUfGcEL5d0b
 Yd5V46CfZX8iElkjHEjtt6SALIOrysI=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9ea730 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=C5mNPc5nWw_qRLBQ1TQA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Z--kMSdn1Su7Dz2bHxQoZbuhR-Isk7Ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070132

On Mon, Sep 07, 2026 at 04:18:17PM +0530, Saddam Patan wrote:
> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> 
>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-monaco205
> 
> for you to fetch changes up to 21c07e735653365e87e09b5cf2c288fc8bd48a5e:
> 
>   qcom: Update ADSP firmware for qcs8300 platform (2026-09-07 16:14:15
> +0530)
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: Update ADSP firmware for qcs8300 platform

I've opened [1] instead. Please ack it there or explain why it is a bad
idea.

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1218

> 
>  WHENCE                |   2 +-
>  qcom/qcs8300/adsp.mbn | Bin 6803456 -> 6844416 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
