Return-Path: <SRS0=M+PL=BD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C901EDEBE0
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 19:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA38DC2BC87; Tue,  3 Mar 2026 19:11:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6B0FC116C6
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 19:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6B0FC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0VKO3548601
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 19:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jf3tdssfr6KlxfKHNr/RSlcB
	U+qalmWDCcnDjBuhBus=; b=Wbj1GoRUReep8gwnZHgITR6+KF8VqhCotYybaRzE
	OkeQ/XbfQ6yeqDox17LdYHUT8d8XtIHGTIMITjRIy5ARN1aV90G5PA8cjPP5yPjB
	r2BAVXgEiaQyZZ5UjNa/9ewCDQRiBUh6Ec4j9sCpRf383HE6XmP8HR/4L7GNUrCI
	PBiPxkIcAkWIq6l8Xj3BB+KHlgxO70r1scRbKhGl1KF1O//AeDlt5U3XnBssT+Pn
	VXAP/b+heBWRpOWsgQ0xwA3JSMoCE/x8x/cWC6EapH+rKDdyDkuiY3P+vBVCwDZu
	NOT+4MvCrCqtwx2dl0hwhhU6fCBGCmtUfQpI6EvRcrB1Pg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxf9xh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 19:11:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4d191ef1so739135785a.0
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 11:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772565108; x=1773169908; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf3tdssfr6KlxfKHNr/RSlcBU+qalmWDCcnDjBuhBus=;
        b=V8DiJ0WJiW7sBq6t9oi66BvNjEP+n2QZCEmlJVAkAhaej3TFU2Mic4ev2/weiURvlS
         n6Cr6v8tzRpu7CpeCI27N3hDPFFMa+O63iFinwHr6WZWJKiCFJwga9maRbPODqFPAen4
         Fz2jzXRIP2fmiRUxE/WT8MyeaaUmi4z2TjpyPWLc/zMguGkWtEEbbphIikzrmspYPpYb
         yc1EjBX9H0Ea4E/bauBa2KgPMZUf3ndL7UVVx1Vag56qXnfUhPOtYM4a6scU9mMSe+Xo
         sd4LlQjEk/Rt8AlnOyxHoO6/9b+suZKj5TKreBQ7enQ5eO6bMn5zwin5tSNRRlNd+nrz
         F1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772565108; x=1773169908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf3tdssfr6KlxfKHNr/RSlcBU+qalmWDCcnDjBuhBus=;
        b=ekfHbzvppjPGjpz0bMnKlx36jVl3sXL1aq0BtRBY4ai2aEd44Piklm+aCjia91DaxS
         N4ctCRZmhMcI/66mSdqsjI/+SmY8TcMRPE+uCoFi91dO3Cs0Y9B5g1NYbdNsmYdq/S1m
         HFnSJXXdhp3YSHzvw1NGxV6MoMaYCAkXzLcjiEwvqA+gK5y2RDnbvXMVF7Z1XirENmwJ
         CAP7yQi95bD1w4p06McsLpS+vO9jtxUf/1NcrfxSpMIKwo+ibBe8OcXY9d7LBU/H+NV8
         SWbBFdcu/Ueh7WnTlSRTVCjX6/YCM9EZ7YDWlTR/rmUifIwwWHeWENP2G6HEgBrDuZ6H
         DH0A==
X-Gm-Message-State: AOJu0YyMaIP0PFNe15SESghsQcREdS0VRSBIQ04kx5po90JP8EOXrRAu
	1a+q5jVibWL50nOajAa7vEucd2PHHbU3CMx/gJPiDOksnT0iWzNU1JPeKxjeNgKxSv6cNWPpXBm
	EVLS/KAsAJ/lXrnXX1r3yxKvtWFschinLST0IvX/CgDEWzG+8b4dHRwAiCKlbG2Q=
X-Gm-Gg: ATEYQzybpI5KBTBdQEBMg6J2F7fTX1QfDjc8u9FwKU4VObR/8k9iH5Yp7He+fK+Mq2a
	bKK5seSS1vCipr4tryPhKSESXlAA6RqNivcQiDQeI7T+G3DZE5ghzZKI4QGnNufxC4xnJM1llWp
	qT7zoJQzd7pDHNdudY6qdpO/m3i5mdpPbWDq9rQ1g3mwCvazQJl0DYcY86f6Dctmd6VnzYiOLlr
	4ZP+9Wj2Uaq4WiFOkXkTMpIJ9Rn7897EVdQ48qi+/qBKyS6Y3DTMahSC3xAD7N9VCoVLTgWV36m
	LrYjKZK0xqrqfPRmM3Iu3LZpxYv0WoZymn+6fWZxPyidTZFwfd212f0DQnWDdUpzVyAVFsPnsq4
	rjuC3H7VBE524hv0o6qcJywFULSWB8zJH4Rytld1KUGiLwBySml/LjvcB+3UcsNk6mS95FPBXqD
	IzrDrY3ngzfM2hPZTt8G2ipbDj9dIiVTDv75k=
X-Received: by 2002:a05:620a:1aa9:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cbc8f15d06mr1968674885a.41.1772565107649;
        Tue, 03 Mar 2026 11:11:47 -0800 (PST)
X-Received: by 2002:a05:620a:1aa9:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cbc8f15d06mr1968670685a.41.1772565107141;
        Tue, 03 Mar 2026 11:11:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123581786sm776764e87.24.2026.03.03.11.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 11:11:46 -0800 (PST)
Date: Tue, 3 Mar 2026 21:11:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP dtb.mbn for glymur platform
Message-ID: <6keezgkgndt5monx7codzjt2wpr7rpwjuzkkzce5jrmrmfcsdw@xw2zhzmdba4s>
References: <6536e572-7fb5-4035-8600-3678dbe3731b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6536e572-7fb5-4035-8600-3678dbe3731b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE1NiBTYWx0ZWRfX96zR56IMQOu4
 DKBs0mb1tELuNqhxGSIh4vW9o10Jwd82h2Ql+6rI4n+q4awtdgCIln25ckx394BacJ8ivM4o0p3
 Yr+gwYl/2PZIWL3L3EgpiPONE8CaS4CyNlam3WDHXY4SB60wsW+X9TyztzFI23vNzbRO0jyUlcq
 XwfxW8cxzcLiWGO55HpK297n1A3L/kQWlpf7wJyrAjUK3XzJY6X+hGTuY6ElME7+BO9c8vLXv5T
 /CUe9OLmLl+12BqIQDuOq0kyxcHK0qVULSBvCJW2cLR7Z3/qrmJhS7KtINOCCuzUdAQN7OkERuQ
 P7+iUB+qU6huCbGOTpdILTaWl7PwE4Ok2Q/CK/+QksONfcvlQZmRubc52v74oxseeufOu29iREz
 d6/ypuwmdsnbS9GUmcWRE4Mn++YsyXRROVit7IGvZoyDNxgHDfh5lkFfwObkTFxoYdRyPAcRac+
 Jlth+ZEP3gnNTwydvMw==
X-Proofpoint-ORIG-GUID: DX_WabZU0CBlgfOcuVDkH9WxeNvfqzzE
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a73274 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=PyUKRLaDpS2szgVtgcYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: DX_WabZU0CBlgfOcuVDkH9WxeNvfqzzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030156

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
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP dtb.mbn for glymur platform

Merged and pushed out, thank you

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/943

> 
>  qcom/glymur/adsp_dtb.mbn | Bin 7253 -> 233272 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry
