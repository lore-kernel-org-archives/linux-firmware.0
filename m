Return-Path: <SRS0=bvj6=AR=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0E2EDF141
	for <linux-firmware@archiver.kernel.org>; Fri, 13 Feb 2026 09:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 100C8C116C6; Fri, 13 Feb 2026 09:58:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F6C0C19421
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 09:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F6C0C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7VK601641987
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 09:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gnV8wCwmbah9GgTbiL6Q9+6I
	JizXbZCkOosCBaPslKc=; b=Tn4VWWEJlT4QuWosKfCUJFjbaSf7iBvn9feRTxex
	2oFHmntu4meUUQlSgbXyHzi56lQMm0d1MvxfkeS2Z4Ipc8Z3R2MpJxmopXFcp3gd
	fUnsY6F3XU82RNJYCeM4dzorGKiFiWbr7f89WlI6SJXVnX5zYKCp1a6yr+Zetb5I
	MrnnIAdvPaCJUTmcfBeQSy8gR+EfLNRa2dbeG1srlIlj/FETw77Av+tJvGynP0rE
	U0UP/dRcivMwnWV7qav2eiwB6+0YPDTATg3viYu8R42GlNLi01uyonQvUcCPGZ10
	T3Nov7pEyTvzXXQmOvBrXWxSTraZnors/WOglbsoVdlUWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ptv2adg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 09:57:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so257158685a.2
        for <linux-firmware@kernel.org>; Fri, 13 Feb 2026 01:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770976678; x=1771581478; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gnV8wCwmbah9GgTbiL6Q9+6IJizXbZCkOosCBaPslKc=;
        b=T2Y0V9zD/KXFvUyfp8Ku/LgYNXwqIgI9fFS4kwcLRJu/nBTk2YLryUQ5NIJI07ui93
         WxQokLY4KxwMn40DO9Vrm+OoWkmcIzYB4vqgMYTqG0sohQWX6lABg/hjGCNKOWCFe7lX
         KbSxyq5ejVJqj/x6NcV4EJU2jz1mee0Fe/sDI7gPVjWdyJ8v4B//z+Jrs0d/+X+/9PyZ
         lY+hbrO4t17carV25Gn+9sYsiDRGhUx0wqr19nhPTfSLfHWQnMRwwwqpNzbJxr3+QTbF
         OZx5D62HeQtNRrhnHox8CgphxTxuERWt8/S6+2+aCYxfd6WBdmgGYODDENqIkgo7pjf9
         oJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770976678; x=1771581478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnV8wCwmbah9GgTbiL6Q9+6IJizXbZCkOosCBaPslKc=;
        b=t9TP+eUcEetN4Ccb2KZ5Exc4cuqVy153BNMTgGf405sGLzF+ydRCEZOBG/n+3wBPVJ
         peVIJ2C8W81AvUzz5hRfXyLHmd9F9pTcxCSjHGMRA+GFVaHuq/rcPdVqG62U5Br3OeNO
         HsnrFmgmAyxd4LvjVp2SmM1DpZqj0+z6HyKN/BrkTrN6JxsO/1QwFbDCjS/6ky/gW2wM
         EAuT+H8+M6AjG+b0ehXrxtW10Sfmmygm8XXxLbCFD8TX5R7wanYpbjMADBsrqhMDCfcp
         jt/sXmqyUFz8rWcqZk4Fxx9CFggT2WP7mnCdD+mXy5UxRPXzqsYfC6L8/gx8cWpVOw4I
         S0uw==
X-Gm-Message-State: AOJu0YyqIeLQjs5MBapw6KLxBu1qYU8ahWj0K6tIv4auvVus7u3MCiiE
	WuW5vfMbtPGqiWT7jnPVlxnqUofQneoN+ZS5GYkJu70RpnXJVhF2Yz09EN+edGGlE4folhtxT4M
	NktWjMvuZJBKmshSvCuBe+ZzaQfmQi7CIA/aLJKX0rS9lk+KOSGRDJRLuWKi/SxdNGZ9qQzU=
X-Gm-Gg: AZuq6aLCBBWxjqe8lgPFiS2yRvRPPvcZDE7SkIMZSFjlajGwbs4wIHvaGzoeVjGTBFz
	x3EStOyLHBFQTDKlTIC540jcHS8z7nVvzkZVfqeozBRO9eqP3yQnGrR2/gHEkkP1BlhBxU9cz7N
	wLC7g+/UsOwnAvnVb00Lf4+62f/W6WnRDmruUBxqRQD6SxVNNao1IpVZ8JisAqqGCX8sTsSdUnX
	oyHDIiYRoCiaFxGTXgBa+D8yeiLBzp2NCwwzsw3VvC14OHhpdEfNfkP4WaAjqV0wVSoAKPwOvS2
	xrMkzIHzOFS6tNGTX0K+LIqtbeoA0QYvqnjDqKOgtq6O39WwlkY2hCB4KLyv8RWn98E/Y9S+BlB
	J2RU1Jeyxp6AaxxLerrb90lnOO4xMy+BtSjniKe7GNDi3LHkmaI4mDrt7A07c3QWxWdYQ2qR4LY
	geHhHH7OE2ajggixOSnU2EM6Udm/X1WnFTWpA=
X-Received: by 2002:a05:620a:28c3:b0:8c7:d2b:b5b5 with SMTP id af79cd13be357-8cb408d67c8mr202402385a.48.1770976678063;
        Fri, 13 Feb 2026 01:57:58 -0800 (PST)
X-Received: by 2002:a05:620a:28c3:b0:8c7:d2b:b5b5 with SMTP id af79cd13be357-8cb408d67c8mr202400785a.48.1770976677578;
        Fri, 13 Feb 2026 01:57:57 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56fe6esm1484397e87.37.2026.02.13.01.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 01:57:56 -0800 (PST)
Date: Fri, 13 Feb 2026 11:57:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for sa8775p platform
Message-ID: <jnek4eryvf7a3zfbfhvckfl4zhtzrni4tu4aakxf6akff2rgs4@gzpejyd5pq46>
References: <b35b6510-e191-46af-ab97-d73b2a7d3ce3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b35b6510-e191-46af-ab97-d73b2a7d3ce3@oss.qualcomm.com>
X-Proofpoint-GUID: Cc51IW6QL-qIoXJa0KSQOsPyl_pHBVA7
X-Authority-Analysis: v=2.4 cv=eaowvrEH c=1 sm=1 tr=0 ts=698ef5a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=zYsNLUGklUvR1X5OcQoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3NiBTYWx0ZWRfX+EkqkaZcgf/3
 pkClFV3kapuc65xs/KwSDHhXQS3F0nIHNfKxOVEjbP2T9wOa5+/7fC0Fxvf6t4JE77iwRETrKeO
 GDzNNe9z1Ida0YnhycvS2rX/2UjP/3EAuaW1PE8jP/49ylu6RJDSyoHfZrxzHDGRCos+1yQl25g
 txa9O0/a6lHozQiyPyZPpyiZbFieJQ3GxnM5BFySzGNt3yJLuG3za8FZIpUskS09SvRrna6KKHG
 49GzP7DiRU3wHsiskXCq4ud18/u7/LqyVhOdcwazEewq0i7zf39qy6asbbaYDdJoRMhUVKAOTph
 YokKwnuLge0iec482f4NP6TAI7TuAwG3ybTCwVvtwiCj2V3tvKoRoy7/hK/QpK3UO1tHfHuaKUI
 /Ea3dMBEe/KXjwDt4N7qjV1z90BBxKFAyJbwTA9W0u6nI+TFPYiHeDWG5tItT9pYfao4i/bfd6X
 1+8fZqYueG333P6UY5A==
X-Proofpoint-ORIG-GUID: Cc51IW6QL-qIoXJa0KSQOsPyl_pHBVA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130076

On Fri, Feb 13, 2026 at 10:01:58AM +0530, Venkata Kota wrote:
> The following changes since commit 92576358fe5ada6724c1c9572aa992ea43531ae1:
> 
>   Merge branch 'amd-staging' into 'main' (2026-02-13 02:00:28 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-lemans
> 
> for you to fetch changes up to 664f8b6adeba20be0960d9cb1b2ad8c5a4d7e0e3:
> 
>   qcom: Update DSP firmware for sa8775p platform (2026-02-13 09:47:58 +0530)
> 

Thanks! Merged and pushed out,

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/919

-- 
With best wishes
Dmitry
