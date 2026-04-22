Return-Path: <SRS0=pPjC=CV=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5C7FA1FED
	for <linux-firmware@archiver.kernel.org>; Wed, 22 Apr 2026 19:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19AF3C2BCB4; Wed, 22 Apr 2026 19:46:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30053C19425
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 19:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30053C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFflnI3528266
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 19:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aqLxG3WVIvhP5JpU4O+9i90f
	U28l/KAqVwQ/qo/UeU4=; b=GNH7XmtqUPP4gz71mtbXxOPI1hn2aPWBzHuYvi5S
	fgW1McJV/7qZXKF4sosFG1oHOxsQjh2oa75VxEKHLftySDKxPpivQ4FaXV5zAmz7
	4Hd+0d+AMfmBY1dI3vyX1Xufn3SO2CuXlg1i4mTSGKXkHkoU4616NuF5VWKhGkIw
	kbcXYtcf+0eOGiGhjTEHQGqbS+QTKbYc9uaH4HK9hb52gseAOnGS0x2r/V5pS3n0
	qn0WA2oqSiy+It8RyWx21GKqO8iRjC3TnHtRGhM2iM1/PWWJ7858qUME1pkS+Ue8
	U+ktJB567Xa1toRXhNhpqWnasei9114YPu09HV6JiV1g5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wrwa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 19:46:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e5a336b44so43664021cf.0
        for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 12:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776887161; x=1777491961; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aqLxG3WVIvhP5JpU4O+9i90fU28l/KAqVwQ/qo/UeU4=;
        b=ONGWunazecHpKuhYrPKcO8OEay485bmFwiYqoVnW/+mwJH4FcStGYX2/q+NFFznBBo
         M5LFqtPNzXOY6aA2kJuIcVxFCAtalWtw5KIN0F3JOg3GFPArH9RLV+kKQMjwadgwQ1pz
         S+vXf4umVFjuveawcl1V+VnD5YfPv0VnGf+KjdZrNN7qpI0zvuNww87pYfwlkzu+16CL
         i3F4uYuA5dJoSq1r9e6sIC2sMNGsAysT0Hb2vHOjowvEK7ScZdvae/IonrJFMYqfM0/s
         oQsDKNq7h8kETRD7w8tBWINcSWRYCfBNZO5bbcT3gLd/Zvg8hD4c5e5lNDIiDpNxLy7w
         yimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776887161; x=1777491961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqLxG3WVIvhP5JpU4O+9i90fU28l/KAqVwQ/qo/UeU4=;
        b=RJAUfri5yTeaTbuHDCiq0hdpvb4Yd1A6v/8qkKF3fYqtOA5VzY5qer9f8iS0LLjQf7
         fp/7nvDogVbJaiPlRTN2AgEN/oaT4MQa4/zDxiNIx2hEFUlF08tgZ5NojCXqtcGna838
         H31K5yRPkpGcYuQVYUzk6EoY2Ted99rXtVXrIT9jQTejWnD9mPC7zLcDRsemKhpJjOy6
         Pqn4+lTM2XHqQ5AVOxf8TXKFTzGwgTjxhufGoGm6Yr20tVdon2fV5Bo5hNdZ8j8QatkB
         0iCp4ZCJm9U9e3GQUR3bY7wHiILfQE6bVjns1B/8RYGixsfvVxhWUFvk/ZdgTgQTcy2j
         C0oQ==
X-Gm-Message-State: AOJu0YxqsXWUM07L3SL7pqYGntrhzfyF9DK/wkeCfrbLpZHTElbc0NO7
	JQk9WOB+380tXPxJz41T0xopQ7opMbwBBHNOJjkcGF033ZRCm3JzLw7n+yM0T7KqmzYx4Z+Nt0z
	X1FcaaTbb8uLhCMWCRY2nyEfmmS4yQ5z+VOLLk5ovOu85bvLskW2k9LYIRaH17X8=
X-Gm-Gg: AeBDiesCzyqWWVwUh9O+TiAU5OcyJZck/5pgzI//WAH6zBNQskwgs9RFyF0TjhB0MbA
	VqD0ZQ3IBYHMWw7eF6FIio6K0QcrAat2YDy/yAQOmDhfcbf0FOPWOgQUlen/Qlxn4XpY6U0qMZF
	8xn+bFA8xq4A4EhkcaTC2zIBu3RNJadCBWGF7nxFKueadX42CJlBVlCkkUJcoLP9KqUupgltoB9
	U4PYudxGOBKo/GxCEETfYXhtcu8px9vd5tkxXfRBPAtA4Da5EDHZLHeFHYBVf9ExUZbSz2On7I8
	0R1lEgcsCmhmzBSYBussG+WqrX0tRCDq4XV8rQwDbILxbPjKjSPfds1VOZbf9pqp1EY1WqeXDFg
	jGqFZZOIf4J1aI3PIVaUdl+ndiiPpwUTYhlzTcm+2SoV4sb6fv5ksRb7PdAw7ldPFCyDj//lt7k
	kV8wd6ZfDudfp19vtr00B7QA9fpoVFPc+JEqHk84MT1fnDMQ==
X-Received: by 2002:ac8:5816:0:b0:50e:5f9b:eb55 with SMTP id d75a77b69052e-50e5f9bedc0mr182391411cf.15.1776887161344;
        Wed, 22 Apr 2026 12:46:01 -0700 (PDT)
X-Received: by 2002:ac8:5816:0:b0:50e:5f9b:eb55 with SMTP id d75a77b69052e-50e5f9bedc0mr182391071cf.15.1776887160880;
        Wed, 22 Apr 2026 12:46:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ebf2asm4683192e87.80.2026.04.22.12.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 12:45:59 -0700 (PDT)
Date: Wed, 22 Apr 2026 22:45:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: vyndiktus@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] qca: Add WCN3990 firmware symlinks for SM8150
 (Snapdragon 855)
Message-ID: <xc55audwvm6trpp4mqgzuje4ktzslnaqzvrylwjx435pnra65a@5gvjgsoa2pnx>
References: <20260422-wcn3990-sm8150-fw-symlinks-v1-1-de2a718d7d91@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-wcn3990-sm8150-fw-symlinks-v1-1-de2a718d7d91@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5MCBTYWx0ZWRfX0PcQP/zRe0vz
 VbPl3H+6Vta/a3B+wxGx0h59Oku+cWj8YVjAndSVYNtyCHSBw30dKmv5R6q4npN1yTZmXy93WgJ
 Hv/LX+jb6OZZwsdjDaeT55idL0kvXuiCpHIKXnHqQNw2SDCUO6lAocK1OB/TtmJ2BuGoVFyRI7P
 Pr8AT9RrZAb2FzkXBXvn8XV2PRfoi/zGB1f0dgBDxtXA2mPPP/kRIJip9VB7mAlVV8qQ1nt6Rri
 SfVECUYIgjNnCtJ5nFLI7bePbBwgLzTWKfcOnxWPHkT4cMCBmcJCyPjOQR+n5ehCd5/Hp7+Vm0T
 eKyR6W92p2buiMMGh9BFt4rLMBJvRuahhdd9KpBJtIrVOfA2DTcAQXLrfTlD4Q4IZoQZiBbvwx3
 bf5/nzEDhQFqkCoa18XQHRh9O5eUDXYx8XHY3In/hZQUKqrIwtJNePq9gjlHLcvg4jIMxeKiyKP
 kO+gYHhoZaaE0LnjCWw==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69e9257a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=1ZjlN9pq_QNEQpgcux8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wUU_50mNAr8Nm3obGu2ZmmcVpQdjop7a
X-Proofpoint-ORIG-GUID: wUU_50mNAr8Nm3obGu2ZmmcVpQdjop7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220190

On Wed, Apr 22, 2026 at 04:16:39PM +0000, Vynnie Von Diktus via B4 Relay wrote:
> From: Vynnie Von Diktus <vyndiktus@gmail.com>
> 
> WCN3990 chips on SM8150 (Snapdragon 855) report controller version 0x01
> during Bluetooth init, causing btqca to request qca/crbtfw01.tlv and
> qca/crnv01.bin. The same chip on SDM845 reports version 0x21, for which
> crbtfw21.tlv and crnv21.bin are already provided.
> 
> The firmware content is compatible across both SoC generations; add
> symlinks so mainline Linux on SM8150 devices can load Bluetooth firmware
> without manual intervention.
> 
> Confirmed working on Xiaomi Mi 9 (cepheus, SM8150):
>   QCA Patch Version: 0x00006699
>   QCA controller version: 0x02241001
>   QCA setup on UART is completed
> 
> Signed-off-by: Vynnie Von Diktus <vyndiktus@gmail.com>
> ---
>  WHENCE           | 2 ++
>  qca/crbtfw01.tlv | 1 +
>  qca/crnv01.bin   | 1 +
>  3 files changed, 4 insertions(+)

Please see https://lore.kernel.org/linux-arm-msm/20260311-wcn3990-pwrctl-v4-1-70e571a18e40@oss.qualcomm.com/
The SM8150 devices usually have WCN3998, which needs some strange handling.
Could you please check and confirm if that patch fixes the issue for
you.

-- 
With best wishes
Dmitry
