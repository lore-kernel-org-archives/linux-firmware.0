Return-Path: <SRS0=isgf=F7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05D2C56208
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Aug 2026 11:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A24311F000E9; Thu,  6 Aug 2026 11:23:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786015419;
	b=M97TOkYJuJJWuARzT3Mzd/rNbS0GXHD+AoD9R5ljgxlUSD3cCTPY9EelJusbG/dokLXf
	 XDvhdSZNbd+dnUf1l8FxwYJfmyXtabVYWraILv4PvZR/hYg+sR4MQOgzWSnO7vQxrcTX3
	 FNe8fzb8kOC2xSUMYB3d0Avldp69fsMoo3kcBDmyqZSVFHhDymGgVovkscT6W2SXOHIRY
	 sQWPvb+Cg0qNq6MK9X63HBwuodyersavQAVrjk8VFyMMg7wFXdCjFO9MNuvaZQZLAGdNT
	 Ct4BuBPYZgtCBTtdlzKMa6tALlNrc1kJobb9O6q9HOYc2l5JmWgKkISmqFC5AyNtUmA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786015419;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=keLpHY6cYpXGrfUeKQjY5cYxZTcYjuMh/bSMdKUYsnk=;
	b=qe1DhcKsoh0nrKzKFphKakPZ2Y02I1+GJ7GFN4fqSKkKBIaAubemqrsmA34tKs3YYb78
	 XFb2tGq0cW+CAQlTK7kVXe8M3CLR1R/qclH4vbpNWvvd7IinZNNIQDYNwnQfrjyy8eMQp
	 Si8XN8G/XGhoFfniqwezq2/LuXfxzuN58aXCddUbZW9V0D1sMb979ife2PNeeNCKf/QN0
	 JbtqMAEr3xFMDH5bDt16Tz5QVHeudFLXYvTH4iiqGNqtCHNpH6xHR+HBunh8imkGb39IP
	 1s1RW83aqd0MCJtlNjJseY+1CxD5X+Rc4Q2V99jbq8dZt8HapJ5T5mlaxJDd5mZtt1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FO09vaHr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xklqlgyb;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 883131F00A3A
	for <linux-firmware@kernel.org>; Thu,  6 Aug 2026 11:23:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FO09vaHr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xklqlgyb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 883131F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndVg1308830
	for <linux-firmware@kernel.org>; Thu, 6 Aug 2026 11:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=keLpHY6cYpXGrfUeKQjY5cYx
	ZTcYjuMh/bSMdKUYsnk=; b=FO09vaHrQrcsyMQi9/TvIDu9VPTM680Y+c7F1GHz
	bkFCFMd7eK64Y3RIR9X0Py073/hSEvnU/r3QpeXkkuxjYti241z0evR7yjERpWTT
	S0MM0l4FWyR9O8l8S6EDB9uWhWBf4zQ+t/rMNoW56e1FccEUAiM2KWlK3GMtkRCQ
	Z4qlebJJh6eV/2fNl+yQtvrPe5mo+BAyU4r/opKCOSwqGVh0jEPv3bbfmFRJcirB
	1Logl1y5+m39rvSc4FjahfPDfQ27peTZq85VQ+T3Kk7IbGdhQEp4MIjwD2+u9pHC
	eAnfW8khBaAi0Nvk+hl+ULlgBLY4MiLbnklttWJNj/zTRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvp728yaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 11:23:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so21594431cf.1
        for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 04:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786015417; x=1786620217; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=keLpHY6cYpXGrfUeKQjY5cYxZTcYjuMh/bSMdKUYsnk=;
        b=XklqlgybWdeysjAje6PwRgTCjAFaAoQkMn2mlMDRruWZED73MawSlrDIRdse9dfron
         HC6B4ITZTmIlyTngXEHcRKllb1hd37ZI9nY0pOpivif1FWAU2a3CAUZMckfiZlp3RSPz
         uw34ckN03h7jtF1FuAkcQAwGaIPi2VZGRSbvBpjSvJq/XAcMzS3R2EczspK6niz/NpXe
         VsmeGJog26ry4xsuScZb41cXJ9svuzspksm7v/T1xp3Mno0CVvs7QB1nsTJlSNwuPqTq
         3ZameAKu//hDKL7MuOzhqIGjwtH/D0JSIyMDER3b2B9npIJ2KsQzwGEA8yrnwKlKiikY
         a0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786015417; x=1786620217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=keLpHY6cYpXGrfUeKQjY5cYxZTcYjuMh/bSMdKUYsnk=;
        b=dog/7wT+s1CKw1MZVwdWcaxg/FIXwsL3zeLB5GE/ndRARBsT5m/6M2KaM+CC+h+MlM
         LmF/s4QkXJrnUNWm9RP/bAdmkUljGsT9pQPTZHMcpXPAikg5nT2mQApjsdjjjmn46iZm
         zesQlGrsI6Oq+09Ebm+QQkPWHHe7flHLfeVpQj5MXmb5MVHB8f+WpsYl09zU7+hA+XiX
         6RY/JoBcWNBlRSd+wwtQHU2Yl+rM21T7eyEMwSPFd0FF+1bICdvmi6rYvbKehbIx7QxW
         JPG7mQCBuNY5V7J0CY7699WJYJONtHYdr13f0SgVz0pq+j+W09+H3saGCybSMFQfnwSj
         sg+w==
X-Forwarded-Encrypted: i=1; AHgh+RphB+YKW2OGN3GmDf09VvttS8hwx8ORHJ9gONw0oqMATFpi58yZsLX+WS6u+wvyHkfuNzbGv2VS2xij8r01gg==@kernel.org
X-Gm-Message-State: AOJu0Yx3Qvgu0GdON74qJKdDug3mQGEP1+emBUbKD27spYGxzrg468DB
	+zSNHLQgVy2FLc9imI7u4eG1W/JJLZbJxskoA8vBbVS3WKCFHEDx+QoAwHJS8oHxKQjDOpFmYbt
	/KJW6cKynPHsfX5IOdJ1BkwNdyMC5dpi6yHGYxfhDQn3dSUzk/F8COj+6byUPWCM=
X-Gm-Gg: AR+sD118gCeE1z5cWVPKmUa0mf7m0TPs0SLKv+iKuHLMzCI+CiDl/2Sa8bSTdR/TXL4
	Uoc0q9meunhRbbvTTpc6EbMDK4HZtzG/T2iwfCa6k6ZwCpnVBplumohZHNKktQylrWm6zNHlwMs
	qxkZNIoJGqT8a7zNFY0j64240TZHCS0zHbu9iB5X912caBiTvyUHTaucr8W8B33vyx0rMnUUSYA
	ub+T9ja9blEI+IGdWuw4v0VpNyOJLHrdl4LQa6Af7F4KO3xg7M9gWYG8RqkAIazsTR+T1MobKBa
	cfNU5GCHqLVjZDLRSqLVirfeEYk+6KJGhBv8DcBkK+ZSPECM5a2J7gydSB9eCW/h4ufLJqjwlLl
	zgaDXRvL26j4Bbmpf6DA2mJWonMG/XCcF9y2JBSBnz5h/gXsj1Mge8fG48mksykOvvvEtanGoq/
	iML7U4zRBfiT71nw==
X-Received: by 2002:ac8:6f0f:0:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52ce6113ba0mr156193891cf.27.1786015416892;
        Thu, 06 Aug 2026 04:23:36 -0700 (PDT)
X-Received: by 2002:ac8:6f0f:0:b0:51c:15bb:b4f2 with SMTP id d75a77b69052e-52ce6113ba0mr156193221cf.27.1786015416396;
        Thu, 06 Aug 2026 04:23:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f6235cb1sm656420e87.1.2026.08.06.04.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:23:35 -0700 (PDT)
Date: Thu, 6 Aug 2026 14:23:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: WeiTing Lee <weiting.lee@airoha.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, Lucien Jheng <lucien.jheng@airoha.com>,
        linux-mediatek@lists.infradead.org, Joseph Lin <Joseph.Lin@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>, linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <wjt4baq52dtqngvvjz2shyzmank4btlpdrwn47hh3gtrl4tmyp@ba5z3wucmcvl>
References: <20260806110130.1393101-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806110130.1393101-1-weiting.lee@airoha.com>
X-Proofpoint-ORIG-GUID: 2PPmDV-uzcbBAqJNzgiZ5FmumDbWYpOp
X-Authority-Analysis: v=2.4 cv=JYCMa0KV c=1 sm=1 tr=0 ts=6a746eb9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=JGXwu8-eAAAA:8
 a=TfqF4IXKzoma3dCZ95EA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4OSBTYWx0ZWRfX0521lOUYUqqa
 mffgIZGgTYffsMSz+p+sXSXXN0Qd4vjPeZmyqgmodGuUZOruhE+rQuMDG+3bAfLInODK3+hCn2Y
 9My5exLFFcfk954aTGC6trGZl6wYqlhx70MkvvLyaN5ta+69Kstv98rCzOShfciUN368d9xQYd7
 c0A5quPy47TrDPZKenUh5jKjAOo7q50j6B9/yfSmwmrElXmo8NlqGcBJDSKoqj5ThalI0j74pUK
 ZuTv2TqJB6dCXyRMqNOOAlDXzWOOAmvZTR+axG4chp6lJiIoPQAbAFovY4rUPrAJie6y6pdmmkT
 2BmDWIoTsozyGAo9Pyy5sIvn5hGDHWgEPXVTZuPxbfMBK+zcY1Tugq7Bo0SE0KwM/AcjisOCRdp
 mVqomh0hoAEnjsCXS4us4Sxm9a10jUrmzjKTHkKd7HJiOFFz6EUXMBD2JMcGZFYH9s18L6rcngU
 GaLx3QgseubK16lBsDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4OSBTYWx0ZWRfX+M26MFVBmT84
 0QpE/h1hqWqC6ezKnaoEVtw7N1TCfUWqfZAzPFfcAUnRCVBKp+/IHcke10+OFgl5DMLerBL502G
 fDnTsFpYV7p1Hh2shq71hmXUkp4a+Dc=
X-Proofpoint-GUID: 2PPmDV-uzcbBAqJNzgiZ5FmumDbWYpOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060089

On Thu, Aug 06, 2026 at 07:01:26PM +0800, WeiTing Lee wrote:
> From: "weiting.lee" <weiting.lee@airoha.com>
> 
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Reviewed-by: Lucien Jheng <lucien.jheng@airoha.com>
> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> ---

LGTM

-- 
With best wishes
Dmitry
