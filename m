Return-Path: <SRS0=EHhp=HB=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05A7C79FAD
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Sep 2026 13:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B06DB1F00A3A; Wed,  9 Sep 2026 13:27:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788960445;
	b=qyAsO53qu9j/094ZabBaQHklbkWiHRL6HZ2O1xn2p8G/4vdPRiBaRNQNiyiTLcxE8OCl
	 0ws1JSYgKT5YWIASEHEYtZDQOR3KzgQ94nD0pHZTT7zxvVDTvOuWHhWbVn4p64aqkA+du
	 w7jtJR7p2w5ixhGUGdYxQMewdg+p3UgamwUuJU2DFAoMVkTAbke7QSCDzjkAkAPttit+T
	 HIQJ5n0vRtmosGJZjUVFys0fvKxLy8P+7e7ShSM3q2+1PnVwBvUSqysW1nQSlZQ30pN4N
	 hEWo6KLQfALDzvjKI2QkoLpIu9C+I/6Kz2F/Al/qSnqTUqYHuC7QMo0gZYrn1jZuYSA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788960445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ldRHbMwbSnSrc1JE8b7LkhyEo89B5lcKeXzPxvb+OFU=;
	b=DD9B/tCa7RSu5NQnZLreoZYitvll7t9QnP730OtXjBaqczLGGjrAtE7BKcnoS+i7PnSb
	 K50S2y6hBM/3oS2lLLme3akEuwAKKqfKyDjmmhGS+RUL5rG8hPj1z+k3NPePBjgtrhDUJ
	 tKzbYMX3DVEfu0C6N+ywwNJAHqz2qVuXZREilOqBJF9Du6cjQNjPy90KqSmWCj9KhbCDc
	 OzbgobjIIpnM41YeIUMpj/IoPH2TyajiVuRGJFQ197azY4PgOPI21FyoYQYFnlhBEXmXD
	 rinHndfhm5g/xF9ewSbOGMMpBZV0jZmrMc8WRLK0D0QrQQlZUj1fgab/SqOHd5784lA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SasFcJcJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+QTxWZc;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05E861F00A3E
	for <linux-firmware@kernel.org>; Wed,  9 Sep 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SasFcJcJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+QTxWZc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 05E861F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689DIQ2G2080969
	for <linux-firmware@kernel.org>; Wed, 9 Sep 2026 13:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ldRHbMwbSnSrc1JE8b7LkhyE
	o89B5lcKeXzPxvb+OFU=; b=SasFcJcJdJsEsCiNfkxziBAJcMvcBoAjgC60SSF/
	MmzBljf/+9OmeqQQvpX3+P6gMgiFgBWwLIfOSXsAQcTHv0wX2u5eCOFspvgFUnPP
	OnGCv2xh/o+lvctK80zUKiWuOWOe6y6M/d1cylUn2Afay+38Roey286dJQnXLF4P
	ta4pXUDItQnzUj+2KunBMh3PZjMv6CgTy+tg03PJyfTb2iarxTSwRMIslua4c8tC
	genjoCITJIjF6furPSEloCsQu9QLW6zfyS7fRtLiSrM13SUwV+v0G+w1eu80O5Tw
	/kVc0DAxkKhH2WDJ1rqXnq0VqampHIM9qDT//NtVxwWOXg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk87r013u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 13:27:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c3796d17dso363815241.2
        for <linux-firmware@kernel.org>; Wed, 09 Sep 2026 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788960443; x=1789565243; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldRHbMwbSnSrc1JE8b7LkhyEo89B5lcKeXzPxvb+OFU=;
        b=f+QTxWZcMapztIhE9FECZENDFRLLRjnLMjeCKPCwASkKurxDFgZ9b/J60lAY4kyoxw
         iaE9/Oj2tV7Bc2J21cYnxnOG4xYa4Wvnl4RD7OhczaexitJJzi8enMtuk5dZ+T/X9l9J
         wSQLE485mk0EIu/Ww5/JJP4MeY9DZtYR7qt4r7jpf+53Wa9FjNi044MWSQ2A/C1Trf9l
         WcD8sSzTZLpHELvx4Sw/mvwxzo5JdUz93CEPl9bj25AeT1CkavRtWQWyvl0BLKL70yi4
         RS/JuvnqMJzyW2EDeTlFSPIlYolCbniDJCb8E+V34khJoynQjm+ri1okvJBPMhcnxIZo
         6m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960443; x=1789565243;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldRHbMwbSnSrc1JE8b7LkhyEo89B5lcKeXzPxvb+OFU=;
        b=hiAw8cycdheS3WMSMHwdX6ux3faq9EWWbWJqjvoXJDrarZixNLf4q/M0heoQAwb7tU
         IvxkLyTsxE9CH7YyEALdB7jlvVTPbysQet321JDYbb3qw7LhStQGBJ51g/j3gFdzx7Jo
         o8/9Pg7aeGzd59xX1Z9MOH7tcnEFqvyeEdtf3mnoYoao9CLw3UQwozzdZyV6BkNwKSdd
         o1alP+QEmgrQlXGpVsztsuEY5mGudZ47wFVJUQ2ftcQzzgbo4P54b5jpbnGBPVSDtKw/
         iWrhJipAnK7ALvvzUJtnXKuYh+J/qJBLijv3coqiMA+dGZDuRdIYWkWhsnqCj5ak+9FH
         /qaQ==
X-Gm-Message-State: AFuF++nbR0zeZBxyI9QpBT00VhiffDqkxpW/KQjCCCjp9i3Wijk90Plc
	KIKvrqtbcY8FaxRqUioFFzwtEM55pgbDGf2TgUy9UyGkhANbP4Wi7aAafsIUnD56KOAeBV4vizQ
	2TntIDynSPrZ3ZjXn2xZ1plAg9tmJQrnFfmLNbSTw8bEC0lWpa2pkpf57/5yFPmA=
X-Gm-Gg: AYBFou0y5pihc56QTYaJh+RMgjzNgF42XF5wjEJw6hiv9horifBmQRsmo88xxWIEri1
	+6Ce1Z+0zoaASo0sV3gPKHNA2fqg1DuuCpQgyQ02x+cKRzkkUQXITbJkj2jPrNid1lQoplhJdNi
	2nxQUqk29Tikp7kOWu+s5j2S1/vNGPdI3OdGmJptpb88TXGSFR2JUGpjTajmX7A0GxB7fu0BmKy
	l2zQwMp0xf9lqBfQ1mOefQZkXIbbH7lJAveq0qmBJFBMNzZ3WMow53exE64PEGHpu0tpQjgYPQX
	a0MFPMNlJQpt7g6cfMWn9g/5D+OxzLUi9JuvYT03nz6BP0Bf27RD9LKCwNpCEr3g/DZyFLDbxIw
	L86Z1hqrT5dadJ2eaEUENjxS3QSot8RutG3egV+gUmbeV2gxxzAtO9GHTtN4Emby/YQ+qhmJJSL
	MXKXsdma7/X2pW
X-Received: by 2002:a05:6102:2911:b0:785:c643:a415 with SMTP id ada2fe7eead31-79077c0c5cemr572105137.12.1788960443114;
        Wed, 09 Sep 2026 06:27:23 -0700 (PDT)
X-Received: by 2002:a05:6102:2911:b0:785:c643:a415 with SMTP id ada2fe7eead31-79077c0c5cemr571932137.12.1788960437771;
        Wed, 09 Sep 2026 06:27:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b88731b034sm214815e87.76.2026.09.09.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:27:16 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:27:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: Update ADSP firmware for sa8775p platform
Message-ID: <u4k7xjatf2qqf2mozbxh4eidelarxby7572onh6m4mgss6izfw@zvvu7urrnsfd>
References: <22cd77c7-8d7e-451b-a689-76a477e9ae82@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22cd77c7-8d7e-451b-a689-76a477e9ae82@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AImJJIpd c=1 sm=1 tr=0 ts=6aa15ebc cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=C5mNPc5nWw_qRLBQ1TQA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1MCBTYWx0ZWRfX67KffTkkBc99
 hblXJ4z1/1Yu0A9/rSczm9okw8mplkbPnNKdTnJ0vPX1pJIXph+bOK2p21jTPzf/woLOrKHpMdw
 13lrQw1WqAvxndf8axxm0sLfqzGKr0BHtQPo8jCwyPglPUYVqa3J0s8/6VUO8aXtOYChHIp+a/P
 rOJzX9gGTu/JQlAuykM9FFWAZmpK8pGYAAjYYTw/q7YR92jpxKc5h81FUCWyD61A7oeV84fE5Ov
 bB5QQee3DDbnYKkkR1SPCPdcP0BARaYvvIGkkMKZaTPJSEkwo1rxRwQMfp7CttzxevXpLESLT0e
 vftfMGGv97cTokEV9B9gbuPN+EfDBy7xuXWzuXKnMXqK42/HozTpHqr8M+dJWzhyOvHj6EhtY8T
 vagGYMNNEZvzv3y2uEi0MhdzOr8slkQ9qxCOVvF8uDup5iVZjkFV2nhia2Te+P42afm04d6GhNE
 9dFtEccwhdJhY16Syow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1MCBTYWx0ZWRfX7AgUKSci4iGg
 s37x7/QVrlYgd9T7CQC08sO40URzbkZrkfrwaEh0/7lAuUIRNX2FyFi1RuZglSMAc5Q622iqZrE
 QCoS16vAszJ0ai5uVaPco1xspFthIfw=
X-Proofpoint-ORIG-GUID: fB0ZeesbW2nDSUb5RD2Gyfyf-Sep3fUg
X-Proofpoint-GUID: fB0ZeesbW2nDSUb5RD2Gyfyf-Sep3fUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090150

On Mon, Sep 07, 2026 at 11:52:25AM +0530, Saddam Patan wrote:
> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> 
>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-lemansadsp205
> 
> for you to fetch changes up to fc3012812ddf47ccf50980fa54ce609a79da01eb:
> 
>   qcom: Update ADSP firmware for sa8775p platform (2026-09-07 11:49:45
> +0530)
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: Update ADSP firmware for sa8775p platform

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1226

> 
>  WHENCE                |   2 +-
>  qcom/sa8775p/adsp.mbn | Bin 6803456 -> 6844416 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
