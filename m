Return-Path: <SRS0=oSiP=G2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B38C61DD6
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 10:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DA231F00A3A; Wed,  2 Sep 2026 10:37:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788345467;
	b=CW4r2MdvaLaViCwkV6tuD+ZUtuBPQqD29a2aNsMoXkNtetlsBYlF0ecPdVhDHTBVGnk6
	 8pPl84OyANPd0q106uZYXBYRTlLcmWgq1Ugz68t6Gxedv6EhIbKTGSNBKoRjtEkMymCgk
	 zOe+HL50UEksrC7SKI/jh2fjJZI93dM1o8wkcm7HkWLKEMu8rJcxLmFg099Xt1xVCOC5X
	 XZQypWQWIEjj2cHAmASyffKcxFx8G/hZhq4RTWBUeLwkhTtZZf8hTwd8pyYMFH2pzJ29y
	 789MvbGLx04hw6gsJrjc6+H6Wisp26d0+GM0Ypn16mMmLOVuMPm0pVDOx8+UIDq/ArA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788345467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6jJVsHpDyBmNWaaDqRkFQrz94Czbc9EfdnKmPjmsEcA=;
	b=H6Eq/ZwkJQbcX8nmPK0713WQ2OWryXwgjczvD5LD/YNBPUpZKjGuLDlQXdJKb/3Wa6P3
	 o0Esld9xikDyBfO4QTfnHrCXOmL4cRn+WxCd/Ud+vVPq+R0nEk1O0JKnA3iQOeAeXdHqa
	 WxNFwzo4LHSxrHSkLwHFkJJyxP/0kvtAdhjDxuaLcqBhToyiVwEGxiLrn+BwtD9eboT9f
	 i+sP1mfpjuH2z94HbhLMO1Bjo85evHZxHxu65tdFKFuMXaAuaVq2AgnPG183OdoG2Dd9G
	 VXJuE0vGQtpnTza2qn35LzT1RnWtGsM0oPZ8+dqME/plNx7dVHOECk+Yo+IduYD8xYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1enyqsP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TD2HGK1e;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C907B1F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1enyqsP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TD2HGK1e
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C907B1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NToK1349283
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 10:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jJVsHpDyBmNWaaDqRkFQrz94Czbc9EfdnKmPjmsEcA=; b=I1enyqsPZiU1kPpe
	DaJRMywGhTRY0HEiTZ7GdZF7ySbWW2B91iXS/fGXM9NMUpvClFf0Hr4K58iHZ2y+
	ejBLgGOxWoFHlBZR6S9Zr8ROPEi3/3d2WTmrrhme0gwN7AriAWeSpTIP/0sBZTpY
	/jh4RR1/j1hE1FC3voHm3Qa5SU11xg2lLm2QC4BRtu+D2dV9tN7+tMyOkRX+nLmH
	ZlZ+2DK8fVkpEebcvFw3jIzxYVdXRtp8XThd4zRuavj+pupMfH+32jKaf+1d1rn6
	aNc3WkJFu2lAI+JOIZ4sP9ckHdphtD5l1wzXV6mYK/7TlFbKC2IsKj9m4zjiDkWb
	zBE0aQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0ufet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 10:37:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737d2f02d2fso777215137.1
        for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 03:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788345465; x=1788950265; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6jJVsHpDyBmNWaaDqRkFQrz94Czbc9EfdnKmPjmsEcA=;
        b=TD2HGK1eKeL3WqCN3E5pziB/8wLj9em5l/ObpdbJVlUWRsHwZdtpBgiHe8CrHtEi9i
         k6+QEcHvRIVFBdI40ie2TSNv6F3jE7WpPb8gTMBJmFE+JCpLNf6UiO/OYzzyZw3IyiBr
         TcKyw9x6mwEj1fFofqdoGJ03+SAshjlDrQM3p2U0ejK2+eyw1izh+GzMohJQtzMJTDsG
         N7dNIto2f6YmxZfnHUuY1/2uV/eyQjedgrGWh9ZRLmWkHbYz9OxgoXO4cfXpFDa61Nkv
         1oZ+CU/K/RlxnTR749ntwKx5TQ65XyrehrPL9WA6ut5IWYJRKpk7+CGDlLBUuZhttxbf
         khQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345465; x=1788950265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jJVsHpDyBmNWaaDqRkFQrz94Czbc9EfdnKmPjmsEcA=;
        b=d/BRPjfyEv/Pd6TfUlVyw2PMojWpWUr7RHqbmxlW0Zyd5b892XiVo+atQWlMN6iWPl
         ZtTabnPrysxZLmeVla3Gio25zseXHb4TaIal/Xk64h9QmR83Gqo7CMOPHecf0rr7CHTP
         rxlo6FubA1EBgUtP7Ywf7uloY+IVRmXbY1s2n9thhdZV9Z2Y51QROD/qI6w8f5Jj0cbi
         jFd08C9B+M6/52H4QPjTXtZGHH1az1DHMRPrAbtVZt1JdGjUNQLetg74a5SJ0JHyCQ5U
         JJaatnbqDNesQwQZIKLDaZ62lmcvIkyxHEAU8M2UduFx8dLFM+EAZp6XJejak45bG9hg
         F/rw==
X-Gm-Message-State: AFuF++lBjPm0xI47/cTOKdhCkb91feVVPIhKA8QIhFL5kQgVyVnRfVwd
	h6FcbhfQdjEOXwP4A65HDiRz+Mph2Wag/sOu52Oc1Vjg9DTPrWvLDIvxKGGYxMnU5Lxpo8ya8hp
	UhQ3r4t67E/dC2SqypJzeBdNtma8q7EBcFJ7gpj15eFPXL0YeKuVS6idPLaAgKus=
X-Gm-Gg: AYBFou3+q/KGJR4XPAnhwGcWAlCskCmunINPtXOUmBhLITO4UjWVwPZ3txmxmBnNSdL
	KvtK/igrLIMadjiLi6w+lzt7Tw/Xl2ScSXcs7XZrmagFoHo90sZbAgaspFlzey+NY5uCKWZF2ca
	aCcDA05NBDWPcRhMEeK+bVlp1m8dk8uCjWSknY7R52Z426MKTYgIdS7E3L4xFgXB1fwzZwJCLIs
	IHAzSLk/gL41Js+CW+n1ZhQ7847cwwb/FyGFcGExazcSmtvhxO8zlAW9Sgai24l0vtVsm2zgi5D
	IgccBqrzNiOYVxNi/AZh+J7Hw4VPVJDxUQBOtLEg2PptVs0oIl+24fGPDL6AAR07XPhqKHtm6mX
	dRPraRPGcioNXKc+ZpfOMeBq97sbhhGrffPSdsbyJTM2jKpTw0ZQl2MnBfQ9dSxwsYaHxTOJRem
	zlXYr/gL5A6Xq7
X-Received: by 2002:a05:6102:554a:b0:781:1ac:8232 with SMTP id ada2fe7eead31-78a1f1e2e32mr1519748137.5.1788345465220;
        Wed, 02 Sep 2026 03:37:45 -0700 (PDT)
X-Received: by 2002:a05:6102:554a:b0:781:1ac:8232 with SMTP id ada2fe7eead31-78a1f1e2e32mr1519734137.5.1788345464736;
        Wed, 02 Sep 2026 03:37:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b1cb0asm500118e87.28.2026.09.02.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:37:43 -0700 (PDT)
Date: Wed, 2 Sep 2026 13:37:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] Add Firmware for ASUS Zenbook UM3405GA
Message-ID: <ol5ixiujcrwl7mtgijgwml5droqmjy7waxqgyuaqdcmlgdnmki@3ytkkuonk3lm>
References: <8e8bb6c9-c6c2-4682-ad6f-6d4f5d41ae38@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e8bb6c9-c6c2-4682-ad6f-6d4f5d41ae38@opensource.cirrus.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX43YJDbSk0xFK
 l0DjSviz8J74fGfcR8K+kR2Iag94gDgnrkRYeX9i2nFdiXB/wzAkjyQOjXHSJwQxAdBqq702VbO
 CqMeippg5PTiRIZb7Z6xNGF12bWzi2BFRud3q7J3dFY6X3EHzInoSDT0aYNmEDIjnyqVv52XowY
 2yb1htad0mdCm0KbCTjBK+BA1ZALuDIZ/CeDbXcv4X1mdUir/LIxG6oznHgPyFdEMJOaqQPrxIE
 DUrsLclPmS/Lko9TWTKvYpgoojXIyhvSSDPCT7rTIcCcg5uS9S6Q+vI2vLkoQTOB6mTDdmrsBYw
 xWE7+v93+qctmChdqm/SsnYN+v4k9CxCqk4S+MliTknQuiFLU/91eAvnNg3Ks+hdRlprcPW2Xqr
 XtcubM0ryujApIZYGS97TGN+ltHIRVnp1a2MhGMJij+5V0ysrkhai0vR8XWnK0R+EKsg5pDM8dV
 wvEaT+7Au9Hmt8utEkw==
X-Proofpoint-GUID: uwNBt2qJYBcy1SrxTtKx3i3f8ashxhBF
X-Proofpoint-ORIG-GUID: uwNBt2qJYBcy1SrxTtKx3i3f8ashxhBF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MyBTYWx0ZWRfX9hCEEEP+yGHM
 nY8xo+a5BsQaqPXWBUZw7lEV+MoKYVP5LBlsbuvf+VtAKi0YKNSIBxdQjR4T85LpCZpjc08QjT8
 KRB+Hb4pYV2kJkGlJbmZALf9BfkYFac=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a97fc79 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=bhfPiOjoWwwFfukgZnQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020093

On Tue, Sep 01, 2026 at 04:55:04PM +0100, Stefan Binding wrote:
> We would like to add firmware files for Cirrus Logic Smart Amp CS35L41 for an ASUS Zenbook laptop.
> 
> Thanks,
> 
> Stefan Binding
> 
> The following changes since commit 63fa520f8f7ee44c8ef397d9d6669a835fbe6f34:
> 
>   Merge branch 'ath-20260831' into 'main' (2026-09-01 12:23:15 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/CirrusLogic/linux-firmware/ cs35l41-20260901
> 
> for you to fetch changes up to 0f386a489272e0aba3675ed54380b8db4b8d70b3:
> 
>   cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA (2026-09-01 16:51:21 +0100)

E: target cirrus/cirrus/cs35l41-dsp1-spk-prot-10431584-spkid0-l0.bin of
link cirrus/cs35l41-dsp1-spk-prot-104319f4-spkid0-l0.bin in WHENCE does
not exist
E: target cirrus/cirrus/cs35l41-dsp1-spk-prot-10431584-spkid0-r0.bin of
link cirrus/cs35l41-dsp1-spk-prot-104319f4-spkid0-r0.bin in WHENCE does
not exist
E: target cirrus/cirrus/cs35l41-dsp1-spk-prot-10431584-spkid1-l0.bin of
link cirrus/cs35l41-dsp1-spk-prot-104319f4-spkid1-l0.bin in WHENCE does
not exist
E: target cirrus/cirrus/cs35l41-dsp1-spk-prot-10431584-spkid1-r0.bin of
link cirrus/cs35l41-dsp1-spk-prot-104319f4-spkid1-r0.bin in WHENCE does
not exist

> 
> ----------------------------------------------------------------
> Stefan Binding (1):
>       cirrus: cs35l41: Add Firmware for ASUS Zenbook Laptop using CS35L41 HDA
> 
>  WHENCE | 5 +++++
>  1 file changed, 5 insertions(+)
> 

-- 
With best wishes
Dmitry
