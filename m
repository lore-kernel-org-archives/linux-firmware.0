Return-Path: <SRS0=nKjF=CU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20260F8925C
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Apr 2026 11:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7254C2BCB4; Tue, 21 Apr 2026 11:16:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0DBD0C2BCB0
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 11:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0DBD0C2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LA3eg81085867
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 11:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9V9ufm0zFgbGySNsYsgjpy9o
	xQlLqbE/lDhFTqW/MzE=; b=UQpfBVVoOXiDFmEs+lEC8kPZ8cVvlv7wCTakfUsP
	nmjjZYe+Kn6aa41uLsUnTiOXo4S4472O6dEKzbCmIcM5DQetehf/paViMdgf1IuG
	DHf7LLCwaSCEWxnJNxG1kbqdHOOQU+ri8RT3bgtKbsPlyJBHyUyUX8+4GMjICLsQ
	P+Dq9JS71vdrFXnNjaL2PO3i/cvHurOcFc/1Z8auPBbY4RYUezMy/CQKKibwiyil
	tgEuqiWEojC64fm1H3by0ReQ6Tk+FTLMqXTZOU7nub1YabMaYWoJ+JWLOyTRfg1S
	AXmql/bcv6YSg2YF1nO/sdx4zFSGJh3eS7/tpCv2RT2C8g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp75a87c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 11:16:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-605664a1046so2399470137.0
        for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776770168; x=1777374968; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9V9ufm0zFgbGySNsYsgjpy9oxQlLqbE/lDhFTqW/MzE=;
        b=G3NsOJFFMZwjvHVwrXr4LJ6+BLahSJIxaCKYwLaUCloOo62NBJih5S+/6KTaQzJThw
         szFKqjw562oBxtTQrS85IMfUG6xul1D5QmnABw6J3KEInPU9XZkTbOErZ3BfThd3WO4m
         LeFSEeHHt2E/ytkujJ4ruNlzs2EsCmkRLe5Ln3TLgCToCpeU6cp78vnPJK5UYMt8h/wX
         u822LRrnDkXdf+GKvpR+ew3Qt/CmXykZUOTe98GwGfQG0OYvJatUvhiugULzYYZxT+2Y
         jOLesgPcIkwe4CZ7hyMflqKrSA16LxJrvJFB/xlZnoe2cke3xdZPO6lfo2SxHVPK7bAm
         uiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770168; x=1777374968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9V9ufm0zFgbGySNsYsgjpy9oxQlLqbE/lDhFTqW/MzE=;
        b=i70ghm9H8VpuXCSYWdsqnDeEOsEymO73zrxK7VwaFZ1haRtGbCZKygAz99zvlaewN3
         oYmAdOjaF83vl6BBYvatAcK0QakSNDMGE0lZcVTv50BZzFAR+vdhgyYxvtXoIJo2vhbm
         0lOy/0vw/WOoSmmWjaQqtb3Wqmf7Y8yyWQVBGi/353wESbSdDwJmsMTl5nVLN25yzb1b
         LG6JxIC3i6qfj0BbDsNyD0KFrU46oIvPOI1YJS1cbkYr7O2YCg1igoA/7o3+q3QE004H
         RoVr6Jee9cwQStAKpGe5GGJ8/F4R3FhMxdtwfHb/UKg4IeHsu0OYyDpRw8xSGrrcxG0n
         zX2Q==
X-Gm-Message-State: AOJu0YyUlcmgVAGh0+iGRIa7gf9wkAW3kINcxIJG0EucUWBX069NSX4K
	IglSBsXTaYd3Imlj28i32MUvo0x/2k35womB1YoUQJSKmIiQhPdiJO/NEOsAE6OYJ5szPfd4o0y
	SWNdtwIIhkolK53M7Upv6m0bSShdcYEZyLE+PekDEPVCI6RFTjw2adGWEEcWjtjRnM/ouE48=
X-Gm-Gg: AeBDietuAfCglAy/0XTewz3GOAx1lnjsi8c8VbpHvZaCQVjSm3ZN9qPwvnDF1HdGXxK
	Rg7lFRAECjdgOQRCDo1+LpO86vmp2qzQpPboUE3M1jLiCp38tBCd6PGz3nP9RjPkIhtoJOHX2r0
	THRHdCU9accMnVaD1I8P812+JKFcTYQlzvC8pGDGe52AL6h0VAwJej74Mf4k4EMxH2ijSktquv6
	boKxrsAP05d+t9ZfQpnzv+DvLw9HiEM9lDyI0LDDOfz6cFexXjWYZkOYS0u/6laIZqYzy5LluAV
	mq9PpcdpFDORTQf2WnDgtYjAydXwnHVepw0w6vjKcm4L+dbHsYqfNeuOFO2E6UgX2mpprhUkSGN
	6LQxfB2Xm4nUpEskZr+CFrCUYYj38/6i4xUfJ6w8xENMl6GgGrZ0VdpVWVccejt/YStiU0M0MlD
	6E2vsDZns+cHPOFCzG49z+36La/STBkvTgbRK0ftCnx9p5Ig==
X-Received: by 2002:a05:6102:162a:b0:613:6b44:3fa9 with SMTP id ada2fe7eead31-616f71ff8c8mr6960015137.20.1776770167768;
        Tue, 21 Apr 2026 04:16:07 -0700 (PDT)
X-Received: by 2002:a05:6102:162a:b0:613:6b44:3fa9 with SMTP id ada2fe7eead31-616f71ff8c8mr6959967137.20.1776770167198;
        Tue, 21 Apr 2026 04:16:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b6dsm29732411fa.20.2026.04.21.04.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:16:06 -0700 (PDT)
Date: Tue, 21 Apr 2026 14:16:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: Re: qcom: Update ADSP firmware for Kaanapali platform
Message-ID: <2xncko4eoluwpsfv64dwhgr2ip2xcbrmhxgncmy5iur5npobi3@nq3zzvq3fjrf>
References: <ad4c27c0-7ce6-4141-b452-cdc87ad72ab6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad4c27c0-7ce6-4141-b452-cdc87ad72ab6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3fStTsiZv8lRkB_T-3GYG5lPJjcoBXq2
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=69e75c78 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=RCOePrpkpvodPGwNuqIA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 3fStTsiZv8lRkB_T-3GYG5lPJjcoBXq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDExMiBTYWx0ZWRfX4dQnaCYSASWa
 x7LDw9kQQI73wzA+NvRiGdqpB9iNHkwFeiOggAfRsSQie2F3tKbSj1A3y9yfuUAJGb7TGS/l4Ir
 VmsezSPtsPYaYfGGtnVC+CQPlEeIAPq2SbcfUEAX0pQJ5lFrCLqbexsjlrS/XnLgCGXwTReY2Qp
 r0i2vgV+MLEhr9rmTHb0Mi9el78LLC+F5KXIWkpp7Gxikw3aBjPVOgmOyhBzuDUzHS6g82hY4Xm
 VD8m7hUX2Hy1iopCIiGOlSZOuEJYVh34O4Mk6B08xiYFrJcfbm3Hi4K+GIQ+P/92DiCMLk2geVK
 tY7QoAO5fNQX9aPH9YqtUtgWd7DTR5kjCRqj6CnAJ3dz+jg/Zh4MShm3jcd+EVoyDtNZdt39Ou8
 b8Mnu/H+Q4Rqx6gy7FuLLmPoE0RrxxnfaHhm1r92qwhHiuK+dXI/jVh72R0wZaJNxH26xrADtw4
 BSswKRDzUc4mvjt412Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210112

On Tue, Apr 21, 2026 at 11:27:40AM +0530, Venkata Kota wrote:
> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
> 
>   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-kaanapali

Thanks! Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1009

> 
> for you to fetch changes up to 80e641ead77ab8b183bf30e45d5023579372050b:
> 
>   qcom: Update ADSP firmware for Kaanapali platform (2026-04-21 11:23:19
> +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update ADSP firmware for Kaanapali platform
> 
>  WHENCE                      |   2 +-
>  qcom/kaanapali/adsp.mbn     | Bin 8311880 -> 8311880 bytes
>  qcom/kaanapali/adsp_dtb.mbn | Bin 175928 -> 175928 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
