Return-Path: <SRS0=fPQP=F6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDB2C55ABA
	for <linux-firmware@archiver.kernel.org>; Wed,  5 Aug 2026 11:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70F081F00A3A; Wed,  5 Aug 2026 11:14:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785928443;
	b=1ajNGKjV5WoKfoTGs8+PoAXXpbCD+CzJnzLb235fabaJTzUKKydjr6arw5e4/mG5CJDu
	 dJ38KSVe7sHiLBHtca/8atpOfozXSkKsoh+/WN//OyFi9iUYBLj2IzFWjqz26YYueHWru
	 p/nzwZ1zqaMQmswW9epFumJFj31922s9YP7P49hc8fVI51DpBbpmyqVap5GtOOR6jSKCh
	 Vdc048vjUx44IzU03jW3g7prlXmXwViAuS0wG/S5Gj3FqCTgUgTEFUSfF6xJoZE5dGjQl
	 j09Awtml28ZQJ7m2MCwMfL6obru1yIBnrYfiKnMj1AFeYihzMvq6w03EI1GoXyRpM3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785928443;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oAJzndHw9wsib8vGGqXPbqagTT4QUYA2hq80PwAgHR8=;
	b=ytIYp1shPJrzKcKL0JjRY1cIFi/VBFqQrO1DludfCVvYG3uT2yOPYz63x4uY57OyFsqm
	 /sB9JuZOAQU7Z1A8X/Esu90J81W8/JZRtBwT+U5+xuPmmjeaiTt/ieK16owLx8HGULI/a
	 +fqX/gAdNDR9HYLmFS+Br/74AFqNVc0O4/aTUGZFu9v1rCgExLbcoelC6kK3rDZIHNV/X
	 ib/3ZEomh+FaPXD+kkEtIwN1DBIdp7+WIGD9dP2KaNHKFuS9+0OefuImE9Phr/tWln6uC
	 YO/4G/byaJkRxCEazgXWhRdRRtaTB3/Fi/p+0jMseXtq+iWoFnYs+hahjygu1dosTLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxDwAnHb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKYP1WGG;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 060571F000E9
	for <linux-firmware@kernel.org>; Wed,  5 Aug 2026 11:14:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxDwAnHb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cKYP1WGG
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 060571F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6759Dfd02442051
	for <linux-firmware@kernel.org>; Wed, 5 Aug 2026 11:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oAJzndHw9wsib8vGGqXPbqag
	TT4QUYA2hq80PwAgHR8=; b=JxDwAnHb3y692ImDH97KgdFRe3OcrtmEWQIZO3pD
	g8u/Q4Etk9/WXziWNmqIqQQBgHoBCtDf2+QMTMUdNSp35fTLgCZ9xTOPcFAdwrYb
	P5Br1AOymZpumqajjOGlqDSEnUx11p3NnZ8kS5+qXczCzsjrS9icA5GOGQdjRg5F
	FScFurUrDj1AnMhXxDZYnoxZ00i/dPla+eKUUxvB5a1lo+juC3m8tGR8xrN1qvTs
	ZijhCY9/osAZsxTqEtF9/4OpMhyvPkXzIrsE8mLDj7CkpTeDj5/3T8bwRV02np51
	ZL8/4H7IO/bCGntQwTj65aQT7eKNNWJ3uhITZVqdYcSYZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2c08fks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 05 Aug 2026 11:14:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so8907421cf.1
        for <linux-firmware@kernel.org>; Wed, 05 Aug 2026 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785928440; x=1786533240; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oAJzndHw9wsib8vGGqXPbqagTT4QUYA2hq80PwAgHR8=;
        b=cKYP1WGGT3ohF7qhQL6wLN9XccXoy2XohCPkYaTgegcG33Ru+CS4SqD4mrUiP9/PTq
         M8aVduyDW9+/Roy9tTGlpHF3+h4JB/kXpbDJwJj53R3L18jvmRCc8hEWF4RPTwyA231K
         ZQd3nZviVVTycIZ/Z3FHo26skbZFHqsh6q/NHir3PEFrkd5e3EhDLLRWvaFoSAzXDntW
         Vc87E82AldMyFclG7rG23DvKeY/yuaiEtki5oW4SpZPkzPMvP7b5nlkzX6g9w8rqpUwW
         60/PB3Wbp9doucEhyMpIZRSZ6tWzuxNTLK1z7sBfOPiuGTN2vw1ce9+6E+xLUFrPxaGN
         zF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785928440; x=1786533240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAJzndHw9wsib8vGGqXPbqagTT4QUYA2hq80PwAgHR8=;
        b=MKZPZ5yvwGMSF1qsSmogdvIcLOF844AZ0ZNekadN3mOG+ysHg9hrfKAHabuBmU7pjm
         HJuT8mwGmZHrkkRkDDuoEIqMSmBRLy0n4zZUXkFGDcfSs6Z++Vunbk+al9i4Rz5hstFq
         h6AJR0DPUGEUu6P8GGFkeE6tdnPOS8VyPSyZlT8jx2sFr+4rg7HOAELht6v1TimcEmzE
         6Q2cqtsDdFHWsc5NRqDKu894eUVSHmmUyyJtYdMdWreMCaqKfp8MuwMXkEHR22YVBjM9
         n/BjbtSs163jicmLkQuK8TmwAEA2KCYKsHmEUv+BDsDULbl4dyEy6aasbTa4N97gjbDi
         peLg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0nGzv3blW8t858GwDWHLNLnSzpm1s6I1QSbWvVPojfHdF87tDopXE4ICZgzsphklP4okP4GkxtLL5p2ddog==@kernel.org
X-Gm-Message-State: AOJu0YwCIPMttFgcY6thBCcPG+LXCKf9elJZ21qO6+2NZmuFyggh7glI
	BV1bWy+e/mQ2ZrkedKRLltCADsldo4clYRp2avgeiJOB6bVRWobCGXexVyeki3CmmP0ePz4aBNo
	kVrlTL3EM8WhHCzFHC8qgHPcluDb3OGRknmgu4yaUGOJ6MTP+RXJ4aISEfBxxyb52WFw92Sc=
X-Gm-Gg: AR+sD12AmTk5IvtLlTMueBSS6G2c9ZnTjkZB71iJLjOjZ37gFYUP6OnQu9hmzAWFgMq
	+w9AFg9ZKwqSK1OfMFo600Ml1aok8jXmysXBKw9+u2gW8oKPTbMGXysleb8W16q5fCl6vn/aSz2
	SgCTUN0Xy4idL1ybqfnUbg79+784zoxAR41XEAetKb6LP1iSumtKvcZP7VHM0l1h5L9tpMbiOww
	JxSMWVisep1foKoHG9As/js35gWEnmxNQI59W3X3gwSIqpPSOGJg6+rKDYgCH7TzCPDOQHQn0gd
	u9cxJtpLbzD+3thr91nGVd4aipGaRE0XDM4kyoE62ac88KLg08I2Bd6ebpT7xTroF6+YBCzu9qI
	eHvSuhAtCSM61LctTn6inHT3b9/RVZNJWUrraRVddHkr2HCJ0hs+qkNOa33NrNsXm5HKvQwAINT
	C/Mu+U5fqYLc6GSg==
X-Received: by 2002:a05:622a:2485:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52ce622dc47mr58820251cf.42.1785928440257;
        Wed, 05 Aug 2026 04:14:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2485:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-52ce622dc47mr58819791cf.42.1785928439801;
        Wed, 05 Aug 2026 04:13:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62c92d3sm103145e87.79.2026.08.05.04.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 04:13:58 -0700 (PDT)
Date: Wed, 5 Aug 2026 14:13:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "weiting.lee" <weiting.lee@airoha.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-mediatek@lists.infradead.org,
        Lucien Zheng <lucien.zheng@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>,
        Joseph Lin <Joseph.Lin@airoha.com>, linux-firmware@kernel.org
Subject: Re: [PATCH] firmware: airoha: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <7vt2klmqyntyscjcffdsb72g2psrbfkobcvjubs5ihpdvl24zi@fdrcysv3mher>
References: <20260805053652.1384026-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805053652.1384026-1-weiting.lee@airoha.com>
X-Proofpoint-ORIG-GUID: EsHpmlQgpFDf8Cu7ZDbvs_d5cBCLhCtH
X-Authority-Analysis: v=2.4 cv=aOfAb79m c=1 sm=1 tr=0 ts=6a731af8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=JGXwu8-eAAAA:8 a=_rRPfmPDU2cP-XhUnEQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4OSBTYWx0ZWRfX2lx34eMj0V+Z
 R6jzzPD95LC35o33I2DoGuA9427+JbEB2KuVp6pTDX8Wn7VezDf0I9qWRKTFJfsv/+h0+gY4bKP
 xo3QUAgbOr3R09r0ZdxbNJFnqSDsWUs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4OSBTYWx0ZWRfXyOxcfOWhadYz
 UeYaQdOubSLQftzoa2fC8lc7rSeAPyw6ug4L7Y0XR3CMjZz0X1FtK+uzp5Foc6vrS1BlvVk9wWE
 zS4kBNaujTPJOHnIffDrY5wGBeLDzbmneHv8AV9yfDPuaiV94u1wgCpu3rMLNLWpPDSr6kOMUlj
 EIUIXs1N4+shkuUrW2SvsvTEIq9LMsspwIiSZpnuDXYtUCYl84G2akrKnWJoAVcFC31KfZK29ZJ
 Oz1k9R8wdmgN0cFhMuF91+ztubt8bMamaZTL5CAscaGAoY+N5qmeI3SqCDBr9Icy6S3yYpUZrnC
 V3zx3ZHdC/CGhamk0TU/s1h5iqInom2dwCjBURmSQdzs8IWQTGiudBq2HLwOTQXDiEMh/nK/Tbv
 7mO5JJ+tyKGvTTGhAxHqYk/I/3YUtvNoYa8ssJPB2apL6w/7sE388zGUZmlWwqFJEh77GDmfo5p
 +YRiVavcRgwEQ2LCH4w==
X-Proofpoint-GUID: EsHpmlQgpFDf8Cu7ZDbvs_d5cBCLhCtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050089

On Wed, Aug 05, 2026 at 01:34:30PM +0800, weiting.lee wrote:
> Update the MD32 firmware for Airoha chips to improve power efficiency
> and connection stability.
> 
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

No need for this Link tag

> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> Reviewed-by: Lucien Zheng <lucien.zheng@airoha.com>
> 
> Signed-off-by: weiting.lee <weiting.lee@airoha.com>
> ---
> 
>  airoha/an8811hb/EthMD32_CRC.DM.bin  | Bin 32768 -> 32768 bytes
>  airoha/an8811hb/EthMD32_CRC.DSP.bin | Bin 131072 -> 131072 bytes

Is there any kind of version attached to these binaries? If so, could
you please include it in the WHENCE file? If not, please reply here and
we will merge this submission.

>  2 files changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
