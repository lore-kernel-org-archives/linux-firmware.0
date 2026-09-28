Return-Path: <SRS0=9+rt=HU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A304DCA5FA2
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 13:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E6611F00893; Mon, 28 Sep 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790601387;
	b=VzD7GHbshEOGEkspvlitbgPLA23LZ3oUpaO+mv5J60S4BlWmD6VzWFPYnp35wcIjpePO
	 gJi/7Orfd1vsKKaU/ABtyULwZUxhQIxN5qm0ABU2zaUL6WJt7PF2VJzxkoWZfAyU3B6cs
	 qw4Qk8ghUtnPrFtVOU5MR7ExMCpVm4oNYPwUBwbPef7GqaObGOyKMT9QI+yAJd0ChmOjz
	 4AXhRXmNYCLnQd/+vtGxZawriUiiuD0z4W+lejg9p1DFPFFwdjoqC4eUZ3InLdVJcLXUW
	 8SNImk3IK4x+eLEjT/KwVHStJJgOp0AnOmQmz7mn0CQ85kg3BbQRm8MLCB6DT03Eb4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790601387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y2gBPyu05znbpEou0p5NOvYwvg8VSWGJEOuKRFXhxXw=;
	b=uvNfMrDJO0IXSA1wlY3LB85zRFPNxK8Q09er/RQ64ehtzjwbLdQp3XWbI6MwMBNXUpGf
	 p4d5QEFhQZ5Tv9ZnXpMjxEGlc9E4ewBPFfAlVEFxSFcIQWak8Yahlsvj+EXaNnNskXgzq
	 +cXZwp65BSo9Ryfd2Dxwem5oLdV8T3E+4ujLNTSV6xjRZvxEoLumrQfAqgV1HcG/VX8bF
	 SXFT110TPRDwKr9pc5EEI99v6I+F5PAqlKFU/J1ouyGyEKrkkG9Ww6y0bEbZ/xuTQtrpV
	 b3m9MCCpEE+cNRHZumqaNtoe1HrOI851uqh539lWy3lEUVydH5N0F0HQz/OyJxJ1kRA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I2zPGeno;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LKlR8T7u;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B99E31F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 13:16:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I2zPGeno;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LKlR8T7u
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B99E31F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAQ6V482010
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 13:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y2gBPyu05znbpEou0p5NOvYw
	vg8VSWGJEOuKRFXhxXw=; b=I2zPGenoJ6k/EFQQt/wCTIbFzZQniCCS+zj2Lk8P
	q5euWpJpWdh+Em4C9IgCbP72F0+uXvJrVljAshL5/KvOFV0E9E5ptK57rN3cJguL
	/xiLRFYMFJlvXlM1hYVZt4yHmbXKga/9XjuUP6XLj3uYH/PKnhHVAGM4Dr+TSqjT
	usjx/ar1x102Gq8FwRqNer4xbhRruw1ydSuEcytBhatjWYTen9aE015UzHuBae2O
	e1WrFSO5CGVJfF4lfveKrphCaVqyE3DgSdUil1yfTNQ3eP7PouIcjz6DRk/stYP5
	kz97d3U+d4iIZJLsyNCaw6k12EeAe1wYumZYFBrBclWM2A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt11hb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 13:16:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806e283b0eso2330888241.3
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790601385; x=1791206185; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2gBPyu05znbpEou0p5NOvYwvg8VSWGJEOuKRFXhxXw=;
        b=LKlR8T7uYS4Npx9cRCy9q4u3++OIPbxgcWFIckUGdg+rFuD8uQGfrSWSFzm7QXQPxg
         AGmIMts/B4tps/GDZr+v0CSzeUyba6BxmIOkq4CJgiCgBzx0nqz2JMem82/NnFqazNfA
         ede+XrTv0tK/7TNFDu1ysfMCCeAWfBl2Aex97bdPvsPtBLGwpKpJJ3NxoGnJwqKYi0bI
         A59/0mQFGw2L7UMl2nCJZLNOeGta0OnwHK1ZynB90t+prMN+XeZx/AXQgcvg16vquvjN
         hL4+ciakUfuJMV4xhKEbOoN/SSxn4gaS3haUqVBsfUONsUsXx45r/KdJIx6d+DE6kZ2x
         KsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790601385; x=1791206185;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2gBPyu05znbpEou0p5NOvYwvg8VSWGJEOuKRFXhxXw=;
        b=lb4c3fqMc/YCJKtHB74ocjFMQ2jADd3Bij4MCRp69oF9+VDj/bNUKgxKDetfWg4WXe
         eiZsmbFNOiSxhmBxgvB3OO2gCihrmWwc1kxQ9IkG6wI4nAznt15N9+9ynDQr6Fy2An3u
         2yIilhEVCykwHg/RuZKc9O8CZW3T+yC0/ytsQk3t2bLULNNITm/nvmv0fEdKwzAsD+w5
         tmUJ9Jv5P+87l27qE+L0EKgUfivjtIVfzD72uhA1xgGXn4EAWdbyQL22UVmQ7ElW6gSr
         AP/qdlZmPopB6MEcJpfYQihm3HsciPI6Dhsf5zivNgcBp08tSS9P6j5msnQnO32FXa99
         Qi3Q==
X-Gm-Message-State: AFq9FYKlevtvNTWxnTIfI+SKn5DhM2F/n6WUkVKjXBfsZRvIidl1mII7
	y3ENmbq77exZ3EcQ0gZtC73PeWr/OShOU4m2lpovZ76tVzd/No5JXSI9vecG14jck4jNuAvaP+O
	TvhFQA9qP2U7ZdtsR0+JuY/BE1d8+2JkoB5dJkX9z56S0K6mlDHylLuvPJCWR1i6VcKACyo8=
X-Gm-Gg: AYBFou1G+TWqqoF55HVMz9hRxEaYDSbQ3VqCqsHX94zJDtQ4loldknsTrGbpDPVSYxe
	He1y4FvEuHwTcp1BXxTjOlJln3zjvzamFfo87mTq5FBJNt+9GaqnhZFlvJIXwZNKuPsIxq+1v/6
	2RTgf+Uf520+ib1iZEzDX6B/dSMsUr3I91MAZGydmtpoHBi+Npjbm2sMlBt0nAQo2oeZB4BIqD4
	RpiazWdshFMxo1HzlKrmVaudQSmi3qbz8fzePx58/h6waGo2XumLCoAGLXTZIDHZjLKdzPBPaZJ
	PQDTdlaFemevZ8XAGVlVg4H6GcroLj37pdckSLe+dmvEhmai56awhsolVdkEXFxLkHiViby4ZLM
	hR0TKyABvMcR9yOzMTaJ+l6cn5FT0OZ4t3vv63ZQhBySclP35MnOmTWw+5tXI5cYmNpCxp3MLnq
	gbQwjX27tyLJyk
X-Received: by 2002:a05:6102:5801:b0:7a6:85d6:84c3 with SMTP id ada2fe7eead31-7af1c79910bmr4774258137.3.1790601385036;
        Mon, 28 Sep 2026 06:16:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5801:b0:7a6:85d6:84c3 with SMTP id ada2fe7eead31-7af1c79910bmr4774236137.3.1790601384139;
        Mon, 28 Sep 2026 06:16:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9deba841bsm500754e87.17.2026.09.28.06.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:16:22 -0700 (PDT)
Date: Mon, 28 Sep 2026 16:16:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: Re: Revert "qcom: update ADSP firmware for qcs615 platform"
Message-ID: <wp74rcf7yoe53mmdnaplyiwe6tjvpc6egffgr4p45apo6mnelj@jdy4wmgeyme3>
References: <17812e6a-365a-445f-81ce-42d5bdc774d3@oss.qualcomm.com>
 <p65scrmutedeyecsfdezb62w4hbepel3cr7evgw5gybrpmmjpw@nn2hszcqd4kk>
 <330d9cbe-fb10-47e6-a7ca-3c20dfed4a48@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <330d9cbe-fb10-47e6-a7ca-3c20dfed4a48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1MiBTYWx0ZWRfX6qwROfTaTU5T
 QjwBqett9GB+gIgyTGiPrt3ycZR0KMvvYQwVImY+7ROH6qQF/pn6AI2bC+b3RF4Y5OJbYh+f3As
 Y/ea0Ag1ZEJfzTpFGRLaFY8sVbmYulLDg73czmFc/g8SS0hHWRzOSK3Ot2ZYFxfhJAL7zy1uZjd
 KR/w1/Z0ukTgGFHBeZ/x+wem9FdXW0rNy1H0mpMWAJ/27JcDlitUdyiMXVhM/nx8c5+dFsEJ5Qx
 YmdOhIDIci2z+YnDp7nK7GEBmfoCq2q/BXDf5CKYfwqhv5HGNXIngRBigGiTEn/+4h3GVE/It5O
 ROnae66JfH+bSa0K11lCIOYJtcZOyCNTTXYRkkRtDcKWsN2o21GiBtdZL2GkYenMGZTEOZI1Z/1
 gQ6/UaO0HUVj8u1S06rp4EkUiy0MV0yXyTDtDg8cT6toP68VfPJcTPW3hgVLnDeXyc5bQ2umslg
 SnqgINg0XUoepKXg9RA==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba68a9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=qC_FGOx9AAAA:8
 a=ZgpBM17xAa7DT5l_ePoA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: hx5Rk09Nv6P9eMolRdb2VoAvF8b0tyMi
X-Proofpoint-GUID: hx5Rk09Nv6P9eMolRdb2VoAvF8b0tyMi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1MiBTYWx0ZWRfXyc/j2sHbo5Br
 yT7RqWCHjAF9nyPSH1NrSQ9/J1OMPrIwrZeeZC/nCOTZpgHW9fyd7tKE0asKAE6ZTrUuwz8gzjb
 dPKAjE6z+NNJ6uSv5H7QSBtz/S/NzpU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280052

On Mon, Sep 28, 2026 at 06:11:03PM +0530, Venkata Kota wrote:
> 
> 
> On 9/28/2026 5:21 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 28, 2026 at 09:22:57AM +0530, Venkata Kota wrote:
> > > The following changes since commit 9b858e5bb58d7bf1fc4d8818cb9100aed6d46f6a:
> > > 
> > >    Merge branch 'rubikpi3-adsp-00249.1' into 'main' (2026-09-26 12:42:39
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dspfw-qli-talos1
> > > 
> > > for you to fetch changes up to e4c6dd83f2578e6c4a53d09ecd165da0780fecec:
> > > 
> > >    Revert "qcom: update ADSP firmware for qcs615 platform" (2026-09-28
> > > 09:19:55 +0530)
> > 
> > Missing DCO tag. Also, we landed a set of binaries with the same set of
> > changes. Have you verified that it affects only QCS615?
> Yes it affects only QCS615. The issue seems to be coming from a Sensor
> Change for which there is a HLOS dependency missing.

Thanks. That would have been a perfect explanation for the commit
message.

> I have updated the DCO>
> > > 
> > > ----------------------------------------------------------------
> > > Venkata Kota (1):
> > >        Revert "qcom: update ADSP firmware for qcs615 platform"
> > > 
> > >   WHENCE               |   2 +-
> > >   qcom/qcs615/adsp.mbn | Bin 8659084 -> 8532108 bytes
> > >   2 files changed, 1 insertion(+), 1 deletion(-)
> > 
> 

-- 
With best wishes
Dmitry
