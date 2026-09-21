Return-Path: <SRS0=uq2d=HN=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCAAC982ED
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Sep 2026 12:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 788621F00893; Mon, 21 Sep 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789994007;
	b=O6vucY5f9TdB1F9BvLBfrB5HQsy3f/eyXR03W8ufSbDAPVIjjMkyLWXU4PwHak/YS6Oc
	 rtu74yvCw6oXKoFJIZIrEIOFamPYPlKEP5x4Bz9iN5+XPcITNEUK8iHYDqoIAIszCtZHN
	 ruZmxQA069EZm82G+f6FCJr7tz02aF7m9FYNY9en3asUvahN1mcQ77ZwpgQ6SXsjravS/
	 v1lXqMesQfbQ2gHF74tO/zVQNE0vZTRYifRe0ZotqAAY/c/e6/6hjUZuOhxGdj7WnQuMH
	 tzQfWuOP6jaf7glfCxMfVv0iDnFfpxlF+H9Rzl0bWl6VPFnIEVc9RLXmcG1qgN/klQw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789994007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cRgujhTTiqvjEvsI9j9LyiOH8Qic8fdniQ157Mf2Tjc=;
	b=gFtrwUauEQoRIt992wN288B6TY9zHmKl0NnvdZl3hlLM2nAkcvcAh6uFf2FICAYMJBKu
	 400ujaGWf6xlJ2/nw/V0BdFCGLWmiO7CnVWENGmZ9p5A206vYtmzIp5X8exCXT+q0lXsr
	 7JhhtsseihoYLPIzloMayILeGbuchBhyIS5SDYAnm0D2htVbuqvrACPt+qb2vI1whCsgA
	 UilInc3p4yXKo/H0aYcX47ehsuWEPfTfYO5hyW0qJmJBe06DNAHpGpM4aoC6wT9OpTbAs
	 XQOA7yJONV1qwsjojGqtdnjEwClziwHJJSVfhtkkZtwc3OobhkuIKSma0+NsuiRwaag==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QStfGoRu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PloI/dKq";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D44081F000FF
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 12:33:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QStfGoRu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PloI/dKq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D44081F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdvoL3818637
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 12:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cRgujhTTiqvjEvsI9j9LyiOH
	8Qic8fdniQ157Mf2Tjc=; b=QStfGoRu5XPZTLCbG0oVfqTLVoVjId2jXoeZmw9f
	8krLIfKecmCdwA75LGhnH2jWzqtQKcavSNWqHiXMf+BAgc3J60mRn+iHE5Sk617s
	/fSrBtn+h+EPZuiEgrEh7S1iVgXgop1KvlJP513jsbhm/R6Xk1/n8EhEAhFtXok/
	XMsX/LE9Up4D7AqYjvYRUkLm40+TFpupo9FHXAiJIvD93z2HPe4sHxSoWquxMgvF
	+k29FPwCIJqAvy3HwWulvPje6unMO+N56zFPeM/bkEnc4gt492q0pshwZlVI9Po1
	AmUEqVRNsjM7gy65v/ek1Ows8MyN/c6mu8cRNy420lKE6g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79amm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 12:33:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c93c294214so995310e0c.0
        for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 05:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789994004; x=1790598804; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cRgujhTTiqvjEvsI9j9LyiOH8Qic8fdniQ157Mf2Tjc=;
        b=PloI/dKqvLmhvTW2ipWd5LH0LA5f6qQKSMtCxwxPZ0a3r3HkVCXprI7cFQJl2N/x9+
         K/OWc9fWKiwLUtMlKt/tSe8g3cEs0RMuRFnYbqOJpqkNFUGTsH4P4Wd6c7H5HMV3Ron7
         swa6KbL/rV45nRnZGyZptelCPqMT1Am97qWH9cbCquXNQRjye3ozH/FQTNFsqt/ESXa4
         bnai7q08vB6sex4LB7mMd6kWmOEecaoMB9OaOz5oIQvrsxGT9nzBsD33NzZ/BbNfAxJo
         9iwp9Y9RrFrFPrIPDriahQxyytSucGyhQeFL/AWUeylpZLGfIgsl5qV/mQw9Q4uCcgWc
         ST7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789994004; x=1790598804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRgujhTTiqvjEvsI9j9LyiOH8Qic8fdniQ157Mf2Tjc=;
        b=0achOJ+SQR2RwnHY5Zg1NuAGUK7mJp6+5nzz7hSRp7KtTkM3jzkn/8Ie4NFmY0278Z
         8p7JBQQqIFjwj7gahpoQpUZkBz4EhL+1Fle1kl43JXo2lEPhObUMDESHbp36JSD03lCz
         l2FHANu+lBvaJALfNRVnpk+oa+yqcIYGscGARQk8Pojg7BWmkOx0DQOpxhpfRXRjsJGX
         fNS+PpQB2uVPPh+YtR3Z80u7ofzh4477YT2tKiFPA5Gx555uTneuLznQM+g1itOS1FLb
         SOCTCzp56BC8YMC3u3/z2b9wkByklDRsTMPMyfNgxk/EyNJoL3C2IoDldsEPihTQ93eO
         jEgA==
X-Forwarded-Encrypted: i=1; AKwUvBzsBKl1ODR7M29kN1rpwgohNA8IuwXfjEbjCwOv2DaooPztLkX0lMguUyXsK2iVOrOHZw1m+mpe0qv8yYwuZA==@kernel.org
X-Gm-Message-State: AFuF++kg8winyl4hRGnQykWpjhS3LQwbpsfuGSNuZBtuQhPA2GqPdCBb
	vjxGjaeQiZ7Tpi5MspSQ4zelqwasQa26ATCLhkpXqgoqBcCt36X33J1kQpCsyaiwA+8Hoq05/xI
	mccVdDb+4B3t6BMh2MXs87Jf8kyuX7oBk+ypy47A+u2SeOU5llaEGMh40j7qMh2Q=
X-Gm-Gg: AYBFou3IKSEgf6ChkUZzr/v/eGROeNShcIzyRfgrt+uCh9dfchR3X11OS0uh2IssOxP
	1aTqeLxEo3utryvTW0pgzGT6kTT91fz5emQZG52WpbwyU0AWYl+rASvn4eLivexhdkw2EpHDrGl
	CSg94CB4Bs5OxrXBqXcmc4swLbO8UyCqwFwN0n+AEg9ShiMjRlIcI3sZsdmJrqEDrdX9biCy0/m
	TXDENDwiOPFkR7vQJj3acOH6iGBXPGPqZm06Zrj4O4zhdWHRee6R3JCHD0O8wL/udXJyz8PMAzQ
	95B4+mEdwCMdaCHzGYY62xolbju2qV6JycVCA2TqWYIXLPH/tqfF/8G37Bz/kWhHEQi5iCo1974
	7MWuxJony67Am21/ElL1n+ns+bakm85J4B+Uac1eAgLijCE7r882ylYC+6xRPx7EfqpP5xeBB2n
	iAq05Old0uYr8/
X-Received: by 2002:a05:6122:893:b0:5c9:c60a:e9af with SMTP id 71dfb90a1353d-5c9c60af4cdmr2628492e0c.21.1789994004242;
        Mon, 21 Sep 2026 05:33:24 -0700 (PDT)
X-Received: by 2002:a05:6122:893:b0:5c9:c60a:e9af with SMTP id 71dfb90a1353d-5c9c60af4cdmr2628441e0c.21.1789994003642;
        Mon, 21 Sep 2026 05:33:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c939c4dcsm1788827e87.67.2026.09.21.05.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:33:22 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:33:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, linux-firmware@kernel.org
Subject: Re: qcom: add ADSP2 firmware for nord platform
Message-ID: <owvaabpbkwawmwm3sys3ecbxk5kcyuupeo5jvf7jxlkwkacn6t@4t42xk4mwyxj>
References: <993dc3d9-85fa-4861-b9f8-3db807c0b3be@oss.qualcomm.com>
 <o3dwuzj2f3lgffpktrm3kw7adt6k2pkhogwwfdtvbjpc27myfp@fogpzasmcrgj>
 <8d136b83-0248-4e76-a677-20a397cf9a89@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d136b83-0248-4e76-a677-20a397cf9a89@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab12415 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=3BPPJBlbNJG-pAy2qi4A:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MSBTYWx0ZWRfX1tzaKfDy3Kbh
 Aw88SuxzLj9iufOb+jJcxucivZV8mP0jWeSlcJ9pmro6xTYDE2ZIhq6sYpakuNVHBYKuHxJ3CAI
 dzQAIpS3hb+JbnY6Y3buSDJdWrgHYlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MSBTYWx0ZWRfX9g2CZQg4IbXe
 BogYEZfKsQ5xi8hQGjy1IBwG7r0ZGcB4yC3OtUyzLyBY1xj+UqtaMbtBOw/VfoMvSqyxsQ/6l/o
 DzQeQ/HGd/Vbiz2o6uLy9Z3GTpkn84I8cfefOuYjDUSsqjJOwOiDrb0OFy/GBJ4t4WFc1KvvLE0
 WZix6qrLnAVoWRzY6Yp9eFbqobLomNQLL5hRRov/aqfDl2JYgNUBfFQVrf/kWLRKHe6Zby1iMkj
 pkJuZXPUydwARlG7+HAFoifXNLFfv/kVMFTgUsiwMd1N4XJHjYhWxbXq9F0PRdbzQkcJ/Bj3S4n
 52DAEqpPIXQNtv4CgA/SPo/nhxj0dJAsElQ3lI/5oabQlr8M8TTn0pVC8mRCGdV6bhlQDKBMMLN
 5p2tVckk1U2sfJMXSKjzGBKMsLVaVwULbNW1wbe46dH2QRx54pmOFGS5ZvERCqcb6ZwgMwcMOeS
 aKnP3SRERNFoMsfZvyw==
X-Proofpoint-ORIG-GUID: J_Ai2PH-VdydItABa-jpoUmTbyc__Efc
X-Proofpoint-GUID: J_Ai2PH-VdydItABa-jpoUmTbyc__Efc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210181

On Mon, Sep 21, 2026 at 09:30:15AM +0530, Venkata Kota wrote:
> 
> 
> On 9/1/2026 4:37 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 01, 2026 at 11:14:48AM +0530, Saddam Patan wrote:
> > > The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> > > 
> > >    Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-adspnord2
> > > 
> > > for you to fetch changes up to c6bed7b5dc85b213bfa40e9032a42cf02595549d:
> > > 
> > >    qcom: add ADSP2 firmware for nord platform (2026-09-01 11:11:54 +0530)
> > 
> >  From you commit message:
> > 
> > ADSP2 shares common QuRT and platform configuration with ADSP1,
> > but requires instance-specific settings, including separate L2/DMT
> > and HWIO configuration inputs, different TCSR SKU masks, distinct
> > SRM/ETM/L2 register windows, and different physical memory pool
> > bases. Reusing a single image across both DSP instances can result
> > in incorrect register programming or physical memory mapping.
> > 
> > So, why all those settings can't go to the adsp_dtb ?
> > 
> There are various technology teams with in the firmware, which needs to make
> changes for this.
> When NORD auto program was running Audio was supporting Audio Reach and
> Audio Weaver, they were not on board for common image support using a dtb
> due to some of their challenges.
> since the other components were common for the entire image, they did not
> sign up for making a common image as they were not planning to keep
> customized changes between computelite and audio images.
> For NORD on HPASS the support for Common Image was not signed up while for
> NSP it was.
> As on today there are a bulk of changes that needs to go in for other
> technologies along with coretech that needs to go in since it is post CS on
> NORD, teams do not want to make a change such as this at this point

Having the QLI / upstream reviewer hats on, we should not be submitting
two different ADSP images for ADSPs having the same functionality. I
understand that there will be difference between ADSP0 and ADSP1/2. Now,
if I understand correctly, the only difference between ADSP1 and ADSP2
images are the addresses. Am I correct? If so, no, having separate ADSP1
and ADSP2 images is not really acceptable.

-- 
With best wishes
Dmitry
