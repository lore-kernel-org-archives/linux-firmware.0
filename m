Return-Path: <SRS0=isgf=F7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF7FC55ABF
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Aug 2026 09:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0E651F000E9; Thu,  6 Aug 2026 09:45:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786009548;
	b=HxUcPHFKkG9mKlbnoPPwAKIYAMHfd2JPCQHgKN3xXb2L4XC1rkemF23/ptlRPA/TX5u2
	 R+JdXGveF1/7OWR2p/PIbq3PPuTZa8mynkK4cWS27XUk6tWNGpZz65wGA8HHvm+WvQIuQ
	 WUerG/1HPXGZjof5XVqr/Rv4NJNzrhRE/BORiJrY6q4x8NleY35ormt0P/f1Um8I9OOqD
	 1S/WERyj6LXwJZFXxD2Jk5UhZiewS/LvOCARt+xvCyG3MA5dGyenEaU06hiDPdRweubXf
	 OUemCvVCeX+ovVBT/lLwZSSkfkY9dDtC1fdNez1LRSrDMJPIHd0/ql9jkaGP8GQ5nfQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786009548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+uGFZPsBCgFwJjV5eH7Om5II8LwPAjxh0y2RDzYGlUU=;
	b=OCn9K3Wn26dydes8NH6HSlJVEZxX6eT8R3eD5yvZE+Ey4GEIJEeAuSBfIyStIPYW8z8O
	 ronT/hdujnEZWcSYFp6Z7ihbfcwyPThxAHIRawmz+Mh90rsRD1Zs/wPaGUKI64X76auOj
	 k3i7DI400x/X82VQMRFSPMX1gTg6Zv6e3184qwMZPDsXT2DfA5+jyd3KLsoD7zapFthIo
	 Nbqb9hUicAy0KydrMBpTr7EozGKAJW4d+7NLwifmDRlu7nSnkH6/7ub+AejOxcmIeOUJl
	 YwN7jShjuF1O0pjfYSJDvgUlGWHkqAM0Oh+4yEmgOPVVco/TALdG8oCg1KE04MwNPpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JEO3uXEz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KH1Px2l8;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30A3B1F00A3A
	for <linux-firmware@kernel.org>; Thu,  6 Aug 2026 09:45:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JEO3uXEz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KH1Px2l8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 30A3B1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769esIt1851393
	for <linux-firmware@kernel.org>; Thu, 6 Aug 2026 09:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+uGFZPsBCgFwJjV5eH7Om5II
	8LwPAjxh0y2RDzYGlUU=; b=JEO3uXEzbNrucVVhXi12PE+Fa17umms3V2RDbDvW
	AFfI9MYfOKUndOCZnws4c2e0fib+s3lglWDOc0PO1jaeAshWYSOugh0OsCyUiABX
	AbuPm6oNtq1r57rX/rCWnoDFhEZPS24NakuhvzzZq7AknTFxrwPGdO5V0TAfR3ss
	BgRb8Em/QHdKcPkZLvyqPlL3dOSlB542r34GM2fZlVlUYnXpvlXJPmWOZUHHkDfP
	cpXcj0fhU6tDUW0biLKcFBl6/xT+luRu1AuXuuvCn735RJ9ophdTVIkRdsvI8ftk
	ZIc3upvXv1r2aGhPD8YUsQXzGEtB48W+qZu9UQ3I7wBu4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud1bpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 09:45:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso29598511cf.3
        for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009546; x=1786614346; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+uGFZPsBCgFwJjV5eH7Om5II8LwPAjxh0y2RDzYGlUU=;
        b=KH1Px2l8BhcfIY/lpntxhWXZTLQbciWDgacnSbG8+HIf8AzcbnlEWfr/iXbt19gDJN
         uvMgoraxv1XNbz5BbgzvRKEIzMPqswZs6H8qEXsOwJRuWQq7XB1n3h9i7iYHO0Dgs/ex
         4Fv/bRPNaT1zxcb6J/TNNpdOREvPTiIvmsPmACNPR9+y9PKaJFpvB/onuMURPmaeXqES
         tFVjIuimziCJuDkgjmtIyc47qBGmtTUaCBs62RNUoC4G3/DGJq2j3o4J+U0wM3IkSWuO
         QnmZcnEGsTn2rOKUy8KBMJhTRKLCwcB1D2fRD4LlM215mxIuMlbHX0+8LCDjC7Gobh3P
         kXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009546; x=1786614346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uGFZPsBCgFwJjV5eH7Om5II8LwPAjxh0y2RDzYGlUU=;
        b=RGJiQdufjQkZH1FP4qtQyFk7Alr3ErAwpMMd2P8buQtEMh8nwkJtO6kEJqprOSgfZW
         UEsooQ4nwoXJT5n2fszmrAhbl/WDI8SITpgwHSxrErbSAn/YnTIc8sSevopu1qv9fGBz
         OsGOdFdxgrzJ8E6a+t38ERVQV5d4ho878f84FO9NzXmEr4r7u6hAsxUHhB559a54kXvC
         VHRhDxkvhDB/Bc2+xlgNQhCS1LoyL78rDQFMC/68bBTGQRpHpv44L9XLir+1yMS4GGbR
         numemJvbT5Lcbq8E/9FmUUokF+IwaX1aDpI/fRYzkWauFyx6KHrFKGMr1VXDpbxGbFqG
         wDZw==
X-Forwarded-Encrypted: i=1; AHgh+RqACgwPtbC2vb1Si33rVxwX2deH5QZPL4LjedP5fIzZRb8J7vTNXxhSg6CMkDLDRu93lGE38iMRhK4XiOu9WQ==@kernel.org
X-Gm-Message-State: AOJu0YyUEMpfT1jB27GVAR2g8RwExQu/6MbZ0STeICjVqMXGHBC13f2P
	eQYdpY+vFF3g/3k1OHa+xKqZWWAvp1/Eif/rJ91Qcq0lfxgk44CyxNiBqvxUxvKLUKavQG6XTgZ
	Eq/i6G1wtw25g6CFTC88EPCG5O9yY77zR5eAUNb6/rTxCBaD1/OE2dAog7Zx101U=
X-Gm-Gg: AR+sD13jFNGtKR+Yp6xgA/r+UlaT/FjgZ/HYw+lFS/ncmUvsynALHYf/gVpSYrSO5+1
	LmJc7JZQ4aSdxBwwB0l2q22eCTjWo+0APafpgPLf0Cu3G7umlG26LsrVEVgYuq+qm24jmKWbzpe
	topiUu89GNCt6bzdh9HrYTzwLmdRMSNFGuFWRFqU3glEdDKPbm5IgurVQLF753c4JTutwVUwU2x
	VlUev326CAxJfpiPxFYWi+p+JDNGuOSZE59rb1Bwlsw/jupPB++ZCHHG8RK+17pzXnxXhFOjW5T
	WZdrfXPuUPM3vS/8/N7/bSAeq0pMhEkEvtXoXl29h6VOifLB//J31ceuQMrUqjUzfNQhjgpfDqY
	D2+TI8yIILC4K6XGirajyZTxmfMcipCNPIIsK4KXXPx7KeCM+NP/yxIR7RcDGYaLzu567241YeR
	WvmhZoL5Ij4AN1Aw==
X-Received: by 2002:ac8:6903:0:b0:527:7027:cc1b with SMTP id d75a77b69052e-52d0b220c2cmr176481cf.32.1786009546487;
        Thu, 06 Aug 2026 02:45:46 -0700 (PDT)
X-Received: by 2002:ac8:6903:0:b0:527:7027:cc1b with SMTP id d75a77b69052e-52d0b220c2cmr176111cf.32.1786009546126;
        Thu, 06 Aug 2026 02:45:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f62ba55dsm648098e87.59.2026.08.06.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:45:44 -0700 (PDT)
Date: Thu, 6 Aug 2026 12:45:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "weiting.lee" <weiting.lee@airoha.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, Lucien Zheng <lucien.jheng@airoha.com>,
        linux-mediatek@lists.infradead.org, linux-firmware@kernel.org,
        Joseph Lin <Joseph.Lin@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <rx5snjmlewatcxis7psqtjggdrdrjsioq6yj56rznh4ood6opu@pscgr3mf5sau>
References: <20260806092834.1391634-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806092834.1391634-1-weiting.lee@airoha.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfXyfDkEMuIHwnU
 AFDL90vsevrFF+nWEyqHPr9+4+aBMcgvaGWlJPj9ILB0l41+POEAVLDa2zm0cTQq6pkrENwCy3s
 gvoiYN3bjvu9J4gteyu6bTJMQPb/IyWa/ZMVqfZo9fjwAmOYhQ8lorpgfr8QLctVkt3zwXVMFVy
 hz14PpzDgCGUz2DttWX9UTxZYzyblxv4sRt3BwagkPRGQMPZrx5kvtoG5+I93AbHaeh71/UKIfC
 WqjBzwC74+fPtpE/D3HSVquKkYdqE0XP3zY/+4/8d2o8cjK96aFFzQhDNQjeYroSOyveX+n0TfC
 kk98HvegU7car9nvQQlHhXLgA38QEjZ2aPzBP7SJ5FlGo1/5fAZhMD0k3dkL8GKEj5wHJrzESbT
 R6bS0VvTjeGR3WgkJvm2YQ5mlygfE5P2nEvCc5YV/MGDk/iFa5E8zqS+rUEswF1zRbD/k1QkLsi
 xzhZQ0iugP1+Dzp9CJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX+3KyDAp/uBZY
 CJm2UVpqv1nOYIPBN7MJjvFxAyVaFfSqgF1IgMIOA3r8FSwWbCn8Yd67BqikwB08ihvcUTWGsSO
 2KF5H97PA2F5LR/uBfn7cjeYQoMYTmA=
X-Proofpoint-GUID: r53ms8e3l6q7ijjiPuOVgVUZ0iD5iblH
X-Proofpoint-ORIG-GUID: r53ms8e3l6q7ijjiPuOVgVUZ0iD5iblH
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a7457cb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=JGXwu8-eAAAA:8
 a=uDFsXW_6BNhtH2ik2TIA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060075

On Thu, Aug 06, 2026 at 05:28:30PM +0800, weiting.lee wrote:
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> Reviewed-by: Lucien Zheng <lucien.jheng@airoha.com>
> Signed-off-by: weiting.lee <weiting.lee@airoha.com>

Still, invalid tag. You already  have your SoB two lines above,
seemingly having a correct name. Why are you adding a duplicate one,
having your login name rather than your name?


-- 
With best wishes
Dmitry
