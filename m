Return-Path: <SRS0=M+PL=BD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D82EDEBE6
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 18:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0743DC19425; Tue,  3 Mar 2026 18:50:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CBE1C116C6
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 18:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CBE1C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0THb3708825
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 18:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SONShlQV6xPyT88WKs/1eKzy
	ZSU49boWaVY72lCg4F8=; b=IY1YSTqEceG63DeC8qqny7ru/tQ7mf3wqUDDICDt
	NkFgEW1quWx+X83F3+QpLeuQuhY3+FD8GFJF4boSgkCwImmFk3kH7m0sH5QGx1GO
	23oJnvfRnq/KI8/fPcacp0mWMJIc0kLLvOb1+zuppE2JnVS4lmneiaXoqLiXl04a
	lCzKwIABbiY82drAgeuy6BN/zucpx1Sm4xkxeRHvv4cD11YdGwPBCR1dk+X/g8Mr
	apxF8VxzenlasQzQpO48z1w4ezCML60EB1jwZgnEcpWIAMHELuAyjlz7FQ88O7c+
	MLctNaW+zMdlDguKMLZ+iXcrErFqx/O9kwquoprrIeQxrQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnsjm2nw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 18:50:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-506a81bbb50so74092851cf.1
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 10:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772563814; x=1773168614; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SONShlQV6xPyT88WKs/1eKzyZSU49boWaVY72lCg4F8=;
        b=LViNL3wPDyOFpfB8Fh+qqshCXncBIm5yiKyiWSl91a7+KDQtBlC0mnAs4CXO3sZJzc
         HbDi3Tjp7afm69fzDvJG93YqvrSljLiDGRdq3jffcfeiPQ1jKQ4Rb2cpU9BIt1vLiLjm
         6yLKZZxKp2qdpx/Luih3GgQFJf4a52ZC1NPUjFKhbMaHm4GiCfjEIRyOxr6ob5pXVb7R
         nvY66Yfqa7fvMA53/FxoJYXnnjQlMwqk0tjlHY5M89sJIn0z5sb2A5aEgsL3AGDrwAWE
         Gq5XlKkA45Q91MHTsTLcBDr04DTTolmgZl06+WNDNzpboPtzPmm/cfl/7Bq8AQ1HtZhI
         MctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772563814; x=1773168614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SONShlQV6xPyT88WKs/1eKzyZSU49boWaVY72lCg4F8=;
        b=LtDVB57cGTCIc9eLrBujWfNSyJxZ84yJkySLVnCaYGlBLf3lVRfiKGKqPaooFnmPY4
         fYUwft10hIOaIkN2vlHVRnZ1owLkT+zsET+o6y+WaXOeoUIIFagGTN6nqASp/Ultekld
         jXTrccSfo9hDcxLKHTdNuoUtXfEBCzrTuMtfeqjGG4kpLvVIYUp8WDhWCVLa5oGttTe3
         e75UkHikHRY70Ga9fqaGPjDi5atVAFEZaTyQ2TuUALkYLGhl5Krq5Jcj5QBrPJHaFfHl
         e2N/hw16jsNL7cRxVcW+YfRw85q5pNShXam3b/mv9bZ0FloxLQpw9mxILxMbPeVsG1bi
         54Uw==
X-Gm-Message-State: AOJu0YwyKQJllV5k9Pw4xK4oLJjScYOXsbhtTIEFv8q4OshP3SlWFtF7
	yZOHfmWCcZdwb3wyEx2NLe6+0nGwlKWMeXjca42pcKOhSznsWncAtATqvMCoi+w6P3ukeBaC1pB
	V78rK74IQ6ep7usVDQOifMiNmJemRjgmUFpATFO+5YjLmENaERIl37tz8tbFFyq0=
X-Gm-Gg: ATEYQzzHL8gMT0wxnkvXHSh/RMYZX4x9awU/wSIPRiaIItEXBKQPXWSisXe6R6rkua/
	/kcJf4nwRF0Tee/VrRaY1z49FD8EkzEyeJaf8chi+xV40YkXtXswS5Z6B0U2Zvqeqp8L9tQ0Fry
	rJNhicQZht/bJFb3rGVEgAHcrulCuiY6LN3/EtPsGCdTufRl4v0MPTWF9NoqDH5pVsLZR5Ccukc
	OtylD3dt2oheZc/8tA0xtEbBo7Z8a95SmSRtMbCvgDDM7YQ7y/oLrVN1uMme3urub1JC8uVG7/T
	M3FV6eqrHSryU5ZN3xtTfMZWhewV5aBl04NrYbC99jZdt4Pi7kaa6eNBBYx8NWBN+ITJaxIpXp/
	c5wWNE/d+jmlf6M6YURAzf7gbqd7dPIF2T3UPGhxucKc5YVIAcJSSmxKTpQjIjJmRonzWUYJEb+
	WGsdJ4Fnbr/1XrBObKgWGGCcDdjUmxz/fJMUU=
X-Received: by 2002:ac8:7d54:0:b0:506:a320:e451 with SMTP id d75a77b69052e-507529ab5fcmr209943251cf.54.1772563814505;
        Tue, 03 Mar 2026 10:50:14 -0800 (PST)
X-Received: by 2002:ac8:7d54:0:b0:506:a320:e451 with SMTP id d75a77b69052e-507529ab5fcmr209943021cf.54.1772563814035;
        Tue, 03 Mar 2026 10:50:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm763976e87.29.2026.03.03.10.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 10:50:13 -0800 (PST)
Date: Tue, 3 Mar 2026 20:50:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP dtb.mbn for glymur platform
Message-ID: <mkeqscppv2llo7qoxwsnbjnwdzxf4z7rtf7yl7xxceuhmjksny@tmrz3quswhyz>
References: <6536e572-7fb5-4035-8600-3678dbe3731b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6536e572-7fb5-4035-8600-3678dbe3731b@oss.qualcomm.com>
X-Proofpoint-GUID: z6FGlRBGjKBoEblAsvrK05ks96JPg0VN
X-Authority-Analysis: v=2.4 cv=GIUF0+NK c=1 sm=1 tr=0 ts=69a72d67 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=PyUKRLaDpS2szgVtgcYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: z6FGlRBGjKBoEblAsvrK05ks96JPg0VN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1MiBTYWx0ZWRfX2FKY/KXhvtSR
 U7p316dGO/uPKldhQho0+izb5acpKgBQY8qtSdqmmmNCB3iHpLWJptCTSbi2UDYDPRomM/IGinv
 u4+xaejcseogqCYvJvpYJ0rCsBSSLqU8VNgI5P9vii8nikSG6sgbfXwSLOmi2V4/GBApl8HLEeI
 vMfpIPW5emm9Ep9y3IbyhtCGdw8asiJqgGkMoqYi9/K0EaULpSXh9qlMEdKdRg+oZ1CNCV/zBFU
 +Hry8jq8kE52AkHEjLcMzy/yQspZOFk/6H+FagUogs9ywzvSnx+bVIDBOLvhq0aoSMLFC4mrUnP
 yxqW6jSOo70TZbJmuP6VfUfbLytKHj82COQC5ThajZBd+erkCzyPPI7smG7owuFdoOeEcy6gAbg
 sO4vx6GPicr4De55uJO7fbnyKsRYmay1Ji+MK+w43C3JqL4dc7n121tXCy5uVIxYNg2vZDPrwhG
 7wzWQgmq9sjmFJxKgTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030152

On Tue, Mar 03, 2026 at 09:19:59PM +0530, Saddam Patan wrote:
> 
> The following changes since commit d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:
> 
>   Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-glymur_dtb
> 
> for you to fetch changes up to eb48837f8acc0c714dc7da556667b81c479ef4e9:
> 
>   qcom: update ADSP dtb.mbn for glymur platform (2026-03-03 21:15:04 +0530)

Merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/942

> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP dtb.mbn for glymur platform
> 
>  qcom/glymur/adsp_dtb.mbn | Bin 7253 -> 233272 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
