Return-Path: <SRS0=n1+7=GT=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475B6C61DBE
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Aug 2026 12:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B2431F00A3D; Wed, 26 Aug 2026 12:47:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787748436;
	b=EjXaQsMR+Y1UtYN/mpjiKCJ8BdViwmk+Waqd3saZ1c1cNnkJqAilBEJ0IeuGMEfhWOPO
	 ktQS+s6qcmR0mjxTQymYrs5li2V0TjR/KWCiXC59Lqj4MoIpGuyRF9cxpa7f7plNQqPE6
	 vD75p7nBTju2fRykmk6Ma5c9w6utHcOQjAQSeN2vBJ9rdBth6tCknHHRBmfWcDllmTkam
	 MictJcUwITy8ZGdl6kcNdWXJ+co6U6Y6g6FDroE7jwQYvgaE2724QKwcKsgBBS2ObDHAm
	 K31/Kfp1++V4F+tZyD6N3ME2+gCUvuCqs19MRtz/xKS0wdQom0NZ6waidkvwq+d/BMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787748436;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i2PG/WkMcGjb5wP9L/CYsI3CGMqNLOARCzpl0j9duL0=;
	b=MS/lnTzhOsdxcAM3m9xbjGUvKawd1PCFwW9ZNxpjlpdiFX5T924Hb6+iwzpHzmyt0fz4
	 JCRxEaljYwQTYpBsYjXFv12yrayf5FGB9gVXzWoRYRxpxtFVns9aYKci7ZwGnpKtD0A6c
	 RHhbWMSi13XAKUi/9V8KFW7GDQ8TGQhOC5LhB4+xQyo5NRdP3fbMZC11UbVJ7PtvZ7eyD
	 HG88uq5+uAENCsCzgMHpW54sMwIh4Q51gJjveAB/Ezd2Qeutm41/bNAO9lU1n7z+m5N2o
	 o2tiS1oK245gWF+9l2f7G9Dm2fmLm2e0a4bCdcC4mDxEMk0Ac7hivAuOrvBC3MVrzgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DP+Bv3bN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=beQ4SJwa;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65CCE1F000E9
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 12:47:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DP+Bv3bN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=beQ4SJwa
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 65CCE1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCHon1223169
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 12:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i2PG/WkMcGjb5wP9L/CYsI3C
	GMqNLOARCzpl0j9duL0=; b=DP+Bv3bNVppYJ8qg85FKszxq0RjwzHhUHpJfPp+7
	c+i1WqzBrCxAYv0MNsE2gYduHjLoCG/TaaofUCCpZYJLD0af2Y7eVx5obu9e2ywk
	4K/AD7BLdKhLMQy//8L8SrmXVvUDsWYRgPtqdQeCUVjnT6KOh/4gZ5fXoEtNCmaG
	KPY4SGcrYvusTEXq7ubEx8L6dGA90V7oVJG/eq3ZRStO8e/To8BFYSBiWHvH88KG
	EZDYStwCwQ88dxH4ms4F/QB2g0oGA7bCJBsenIPWao0Q0paEbZRi/GOYDvRmkv7+
	bAzS5oyiotZpLg/6DqT+37wRmuuOnCDFDxr7PX7iJW0ZzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1gj35f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 12:47:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5276aa86d00so10343771cf.2
        for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787748432; x=1788353232; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i2PG/WkMcGjb5wP9L/CYsI3CGMqNLOARCzpl0j9duL0=;
        b=beQ4SJwaIwFWTj9TN9G0lmdl6iXGN//xHD8Qdx8yViKAhV/uT2Ve1d17afhnhNRo7y
         qPmKtQkMYeUvK8NRdx9UTYkZ0GjagnWOs9Q+lQmUpu4Da8x5x/k3TnU9+nMelEpmZrkB
         +IuSsJWfoIlTVfRBKSEx5x+WWHPHZI9kdtc5fApzQizDchH0floSvHR44OsSfVNQqenr
         B9b/Br10AbbKJ8/pKYr1TeyjTKlnHKcEWmB6uYyaLSsc/d8dUQB+4vP+nAHWfIgzYAhR
         5BORZFA6FvyMQ7+3HNP87cXOvQsrn2oQxTPqSBRL/VedeO8xPhtKeD/qhdO4P3OzxQ+x
         0eXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787748432; x=1788353232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i2PG/WkMcGjb5wP9L/CYsI3CGMqNLOARCzpl0j9duL0=;
        b=jbaFGeBCsLgUQhxLX3VT34cZFsMmJVWC3ie0ktlprGX2EtWhmHDpQk5qw3S/zXCOm+
         UOiNDcvoLC6fxMAz8v0o+rEmfWPxltVBNEfSwF365y6NP9fIJhePblaEyBxUyWJnSx15
         UtXDwXb9K2+VQrTsChkFvSoFIyUhLgGPs7IoX92gL/5FCVeNAktWKJT2KVdBL4SJZhY7
         0wXjzPB3Zqyyc7LeggcWs2npZuTdEKQPkSLmxY6AuPuW7uuc5zJV5raegLCuqNXrkuFB
         RKEvyJIQej7SeYIPi2qCv+cIHyL9ZG/hqVNHZGcW7aIm0AbBcnR36IiLnkXi0G2NwBEG
         090g==
X-Gm-Message-State: AFuF++krmJkraoBQ8hAJyuNLrKDOJpmsrGkDYfhWgk5hvvTcU8tAq+je
	2HGSwlPK99I5M7AdmPY2qQ2SI16BBh1VDtkLLJQjGBI7gqrCMUzy2AbsVz6LppliW9x8M6WdxTe
	I/sVfMiSjx0MYXtOCUHRErHoyMjj5mrzMjPNf7e+cQZjtfsigqmoLAZvM1HhfSi3xKnwJUfY=
X-Gm-Gg: AR+sD129RjBPwFyJ29Up3jPlGUu6BwgdrNv8s20CxYJW9VZANv8lMRWS/Qix8VTdu5h
	MrXDHoulDxCt4q85zlj5UpjwqYZt1eBVOjeSa0+oN3yztdfGXhsQcOw4YaTTCLZBuMgIG3iAZ3G
	BQDGfFA40rdUzPA5xUvEChnME4Ua8CP8gT59F15H/q7hEaQeGOl72PY/wkuslOeKa8CTJH6bJ1y
	ubqMtrNqaSRTmRQ9cU3dBeCZDCeAWHJGqcYJwUk3wqfgabMMO6yg6lCYgg5uJoHslp5IfAIFsth
	+E6nfFM6Tp6py6JlEE2OK4RMlQChsYJW6Ix2Y25u9pytsg67suSjG2pPKmoLpgeBJbEyRXBqBpn
	hjkcT4WI6XoqpNPDkgMP5/Hk4L68DzDOaD0jpKMyas/9kOf7HzVDcvt77OluM6Rq8yJ0Si47OIk
	YypoY1/qnnP4xY
X-Received: by 2002:ac8:5e53:0:b0:51c:1132:c80d with SMTP id d75a77b69052e-52e42386d6cmr53031131cf.28.1787748432318;
        Wed, 26 Aug 2026 05:47:12 -0700 (PDT)
X-Received: by 2002:ac8:5e53:0:b0:51c:1132:c80d with SMTP id d75a77b69052e-52e42386d6cmr53030601cf.28.1787748431889;
        Wed, 26 Aug 2026 05:47:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a41a249bsm578447e87.46.2026.08.26.05.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:47:10 -0700 (PDT)
Date: Wed, 26 Aug 2026 15:47:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: add HPASS firmware for nord platform
Message-ID: <t433xct7ravyod3y3cynlt4s7qkjha54732yvsguia3a3j4ncn@jgpyp3smfwmp>
References: <9198246c-7518-4c3a-b163-8b3ecc6292c2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9198246c-7518-4c3a-b163-8b3ecc6292c2@oss.qualcomm.com>
X-Proofpoint-GUID: S8V5uj9d6Q7Qs8m06kAXrSyirMTjU4xn
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ee051 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=XCj2fxymft_Cxrqhia8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwNiBTYWx0ZWRfX2mH+EbXAS0xl
 HNh9rpL4rs3k2R9HECwpuw/uMCH4Sj/Xfx3wmD3rXGcgKY6/I6voh1PfXMxbug/Of3cUpKg3/1I
 HosChfZnhxKe9+xUsgUGCVhJpY9qddU=
X-Proofpoint-ORIG-GUID: S8V5uj9d6Q7Qs8m06kAXrSyirMTjU4xn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwNiBTYWx0ZWRfX89gsUPzTTox6
 Q3ijF8Y0gQO/YTLhwG5lUCYc38jXjbuO/L2o3/iVJvhGGyOyzPUOP3ndEmzPr/QxC4BlbDzNsVc
 GCEvN8eKv01CZ/HeYWMdvXHnmW74fdeVPuSSRmI0Zr6oV03reZpr3mVyQ6fQj97MtzsJiys7iLq
 lLtAahKWbIPyqkDx9RS9/zCWQi7uuB/nOKD14DN063bX2KSwJRZt3ECMLg4dNeQ0KUTIlFn/HlD
 y0msZFE7VERxuiB906nOvYFn0YX8BbL9XYiQvMZPOLiq97xWHYRvh7ybRofaJCsKS8y+ElCdI4E
 ymbbvUKe95Q6FDplw6/VAAKr0KRhT5VHIY1yPpQdt3+gLCOm8AhM7HQXbthPBDOwzIjp/oQrCkf
 fYEUIFIbviK60RoDwjiHhwehuwXymz7JPNw9sew1hKl6Fp/zOuDm+BidBTUH8Q5WDMuRbPDd7/p
 wPqtWac8IM2GnMpKqUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260106

On Wed, Aug 26, 2026 at 12:26:38PM +0530, Saddam Patan wrote:
> The following changes since commit 01205307636157a12c29e6a774bf83b218732050:
> 
>   Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-nordhpass1

What is the difference between ADSP1 and ADSP2? Do they need to have
different binary content?

> for you to fetch changes up to fba487041d4194d30fb599b04285ad9cd766f281:
> 
>   qcom: add HPASS firmware for nord platform (2026-08-26 12:19:47 +0530)

-- 
With best wishes
Dmitry
