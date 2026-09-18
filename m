Return-Path: <SRS0=vuWs=HK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E85DC982D8
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Sep 2026 13:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1116E1F00898; Fri, 18 Sep 2026 13:46:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789739164;
	b=UhMxhKMxSI/IFYuRLO3KdJxpwhYcue6XLUDbWGsU5V80q80Q8WbQPRQJ8goErPR5K4Ya
	 kQV79wuE3t7H06kg4Xx56/SKMuKOdjFYc3OpW20wmRPabi6ANOSSujHOx8Bsrb5xNq15+
	 WVuT/vg+Gr0Z1yCNy7Cb7K798nlv8FEmW+hRlgolzTLHEVFESyk14ijyzdWQIXez4o7IP
	 ntWOYg/nyIvdVdtOqVRs+n4kRWZgMw62WdbT2k8F0/54GWpHpFyXearLZxgukUcrXlJyz
	 uPQUjgDuKCl3HefaJtCbY+nx08eEGydms9T1LF7BLajzhoxWQaKXTVpkNDYgJ2nyyWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789739164;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wM7TlgrXwkUHDs183AbaXOIX4yvXOQRPflcJIJBGv1k=;
	b=MT34yGVRTupzl2i9f9zsi7YM/oOhyQycLacQUDWLXdQIMvcu5QMAW/BX/EdZlAf56YHG
	 xGPwkt3ZW9BY9DXH85d077YpQTgfg4JnBnjCWPkKSLF4UZ8gp4gLVQ38A5wnlrn+yOgoV
	 2dXWraQUsiNDuVmp5ztllOLCFsJob71c6nQiJgyqRUW/qAX+Dr3QbDsgGwJ9KgC03NUR8
	 rNaFKakVN10hLTaFUyxXAFWkLlHtDI42a7zCLZgOUM13JpLkUUDefgKwOtnMmg1goRCtB
	 pKE7CYuoCL51Z2dml/afQWY3x/eS0PVN/p9jK1zlm9WT1ynE+rkqlD3k1MfCvyXPrJg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXb0aII7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Czdfa6mj;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6814B1F000FF
	for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 13:46:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aXb0aII7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Czdfa6mj
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6814B1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDPFSG046866
	for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 13:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wM7TlgrXwkUHDs183AbaXOIX
	4yvXOQRPflcJIJBGv1k=; b=aXb0aII7SfgxT80oAfHl4e6IG/0nPUE2n8BptdrG
	kgSf13ANM957qZzGbm7I/VoWj3umMtJUnQRGyofMDbRJU4OEkNUo/VW/SsKMgF6P
	yRe01jWnEKEJR6/DZmTV4eGgpG9EN8LGz6f0iLbZDGZrxSFX3WIK5yQ1HcpaxuGT
	nRumHGOKSLddE2yFu3k3SGwHCtSc+2a/W/dIqzpcZCO5T6PUSrzYIC/+prXJ0KN1
	mwY3F4UagHS0063YXhiJzI2O/2NTqFu5oZCjF0BQJcWvqGR7PU8+a5yKEsy9BYZd
	roJgjkUfRcDmdLf8SepLiInCavMY6NoWsMP2n/HuLP8MTQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5mdqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 13:46:02 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cb2f3c6f7so30096241.2
        for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 06:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789739162; x=1790343962; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wM7TlgrXwkUHDs183AbaXOIX4yvXOQRPflcJIJBGv1k=;
        b=Czdfa6mjs5G8gsrqQdVkDAK4Ktlg8ey4KAHbMbxT8ftTgCR8VCkGLGkHNILRO/AT4d
         uDj3p1BEMAbvVkZ03RVceysgtQBxJ8KackMhMmFgDc62MFn+2RWMqKrFCb2QuSPl6BON
         vT/FARQskDGiyggw5nYFcTsi3pZq4vabL0LOLJjm6nYziS/ExXRUxj2+/fZxzgsVv0G7
         i62JfwFXRJusJ/vHj6aM0PwbvVr0tKsaXE8QT7JopLP5Cv1HOuc+V7ANZbXXaJHLBrmq
         kBjA3TgCMKxXw4MDRjL61F9AZjZ7NB20jV2b0QchsRu4t9VlG+VN3xmYjNzB+J06LLnn
         cb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739162; x=1790343962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wM7TlgrXwkUHDs183AbaXOIX4yvXOQRPflcJIJBGv1k=;
        b=RfKe8PSTv9yHGB9/WXgewTpYsnf2v6zFrlN/+c7Nr4cTaelFoFtKOUTtm0h8LQRKed
         UYyXUiTPebT8mJuswzzD8wXJTe1jm6oWmEZ99Gw0OXXOxehM/td9KcUcqJW2UEyOjTGn
         wBKDgTLteih8L0LAYKPQSCz32maOyBZ26ChdCwPIT6vskFiONPQoZnVEyaOdldKIgIF4
         FGcyPw3sOXi7BEC3gPx3Uu93Fx5VqzpQ3sLJlQU41bh8bKiZ8k5Mh2Ho4tWQ0i7DDwG6
         lVVlcFq0Ks7K2Wu82h4GHAZkQ3v+bzBn+uLQQztBEGUV75Nzxn0OmBW5IBakm/G9r9Ea
         53XA==
X-Gm-Message-State: AFuF++mfF7wThh7PvTY68sZov5Wi1f5vtNicCozdU9wldnosbhKdCxCY
	JtxwlrxqB5Y92jn8dJwVrCRDEB0T477R/hQfgSTI1XVQdZT0jxU9ymoDuNTmGij/GHg098thbkC
	i08uqEIp27m1shxUFeYya3SYc56UHIhgyr7YRcvw6Sg/0yqed52l8RNO06FyCtBMaqoIoGCQ=
X-Gm-Gg: AYBFou15jrhn2Ywc/RtLyV2CJJI/Eesp6W1iolR8ot2c4uVbKStVVTte0rEkoAMxodb
	N/jqrhK2810LLT2v6o1zXbzH9xO2CU/pvgtyrV1AY54uRC33i9Mt7Br+HjGpReJcOo4eDU0az67
	0hR5AjOkZeyKbXBbnD9msZLks9qR79hkcCgxBmjQLwNQllJDRPP8hdO9oD2y+4TnelnUa3fhHNV
	oeiKxfj3xsJWfvvjZ5EktdOGTcnezMcab+uHoSNIZVlgw00MG9fSa17pWHMrCO2ecAiH/KnmZa5
	JciH76WGbHHtpM1lRTKG0U96/guq1DZH8ZKOyRJvSFumLleudXHJdaH07vl/nqNivyaYUg79j2k
	/X4hCESaUgB029iU1M/0zCPbWt72AER17JeXTxz8O4g5sAMhSr54rDoY5EGY+d05n9H/+PSMS9a
	T4miDp9l/Nfi9i
X-Received: by 2002:a05:6102:915:b0:79e:bdc9:5b36 with SMTP id ada2fe7eead31-7a55af2e4e6mr781232137.3.1789739161677;
        Fri, 18 Sep 2026 06:46:01 -0700 (PDT)
X-Received: by 2002:a05:6102:915:b0:79e:bdc9:5b36 with SMTP id ada2fe7eead31-7a55af2e4e6mr781203137.3.1789739161098;
        Fri, 18 Sep 2026 06:46:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5fd7b7255sm4940711fa.12.2026.09.18.06.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:45:59 -0700 (PDT)
Date: Fri, 18 Sep 2026 16:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add CDSP firmware for hawi platform
Message-ID: <ccblpglkjgakqs6lbe4qrzg3ogefusoe56vlupwasedaqjbr56@afdhivhkgzs2>
References: <0a89f2b6-6216-4a60-90b7-66110f713158@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a89f2b6-6216-4a60-90b7-66110f713158@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE5NSBTYWx0ZWRfX4S8y2Dp8rraI
 AKafPmN1k1ldikEW2lDMR5zGVVpopj+/BLhbHW5VOGHRVkg5Nur4X/ISlbDR5HGvjovHMmHpOB+
 v9Cy0hW83bE364kgIFKleffS+IrIxW80NAAV8YysHxhNrUmbrpehkBPVHQvJPmRDUZyyKq2PFoR
 GQRJkSBRDB5prmk1mDEQofHvsEGTJGvdnUZLr9H3TriCxBgri2LLKoWcjqeBdf3SZpBLRNr3Nr/
 5Qjm3/Uj//ga1F2vd+RAptqKdAMgpQt+mzdqIh01LrJqNRGp7cnsSwFsNLt395JGx+w2jbX3pS2
 vqmJTd8jMKoikVRPJRj9JtQOT4B2omzWU1avwMkhlE/SYwBtvLPohtTwEfI9+X6UDKRe3qNAnUS
 BfIYpTfxXQ/J0e36xMnTeZQE/LrgDPdzIMsiBwmNPbo4I976EKZ+80W+Xavm6Sps3WRjivdgB3+
 h8N+8/PKwlmSb4R2PQg==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad409a cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=4lIMCPornwSfzLJi96wA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: K9CQwJHzNriGWWn3EWdEF-GXlk96uMlN
X-Proofpoint-GUID: K9CQwJHzNriGWWn3EWdEF-GXlk96uMlN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE5NSBTYWx0ZWRfX26Nh0Z1h9CsJ
 3dPr23ZKUXp2jXvaFWgolrMcbuSORoQMgdaNhXqVrHUxz3okWnV/WBHZ79pOXu4jm+kptRBzjiz
 bUcHn+CEQjB5lMA+ZDvYtZYK4kJSk5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180195

On Thu, Sep 17, 2026 at 11:33:01AM +0530, Venkata Kota wrote:
> The following changes since commit e289868675d1071935ba4dac48acb6600f278d57:
> 
>   Merge branch 'qca-qcc2072-clnbtnv10' into 'main' (2026-09-16 18:24:09
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-hawicdsp
> 
> for you to fetch changes up to 5aa34a066e3d020cf3aa98805871786b1164a51e:
> 
>   qcom: add CDSP firmware for hawi platform (2026-09-17 11:20:41 +0530)

Thans,

Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1258

-- 
With best wishes
Dmitry
