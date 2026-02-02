Return-Path: <SRS0=AKqh=AG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AC1E7314C
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Feb 2026 09:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75BE2C2BC86; Mon,  2 Feb 2026 09:11:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8096BC116D0
	for <linux-firmware@kernel.org>; Mon,  2 Feb 2026 09:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8096BC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127eajv975770
	for <linux-firmware@kernel.org>; Mon, 2 Feb 2026 09:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eN8FZFV3v73ds3IElQVUqYG0
	lD7MUuBen0ntV/aMJC4=; b=ZywOnEcTXNX8O6U/gFHyjGPAHh21W1ZYtNX5cCOl
	y1oEsmRmdpW3NVh8VWprqk+5YEuKZL4pRJlke49qeaIGFuWpOewn03uhKLAqLTRO
	bThBjLOysL+WNYO6W0y58AbgBi+gOZT8+O1naZsDgrncCCYATnD5b27Vfc2fuo0l
	hCnlQc9aU9Kr4sACuoiBmZmy2LpLF2L0RCb+XsgJun1nKHnbz/O83eI6j9m7Tk7S
	gkJWT8+aRjDNcO2kcMYKjqHGFzDWFPN7gGv9zBQo8Ax9aYUqa8C0dn/amlWore8m
	l684gd7dMNEW2aXDlY+Rj+1S1oL3KeaRqfmWvYFN7Sja0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnvuef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 09:11:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b315185aso642217985a.2
        for <linux-firmware@kernel.org>; Mon, 02 Feb 2026 01:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770023487; x=1770628287; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=;
        b=cOzNgXEESqpAhl7A0aCBbKHsRABXFUCfEjuNE4o7lxC5PIMFQoscELEiBWZZHos2WM
         xdv/uUxeshtr6ZJ0MpVctxFXT8uop0Un0XbsBXDfoluMh5Me6glCnst7e5h6DGnQ53Ff
         3LX6ayQtNq1+ps2udlBW3wKaKgSGGd5Bti1qXRlgitkEkEB8jICaUPPTfoIVkLkGLvER
         nh3DZxGYGSf7RNK8OyEiCK2VLcieuFnt7wkNvPieHzF1vO5ZHPAbK7NunuaU/v7algOb
         W6WzDP+DeyvPq3SmJviwixqJUxEWWOdTRJ50ta+FjvXO8PoXFYFKeM06UFunjnhvEOOn
         FQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770023487; x=1770628287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eN8FZFV3v73ds3IElQVUqYG0lD7MUuBen0ntV/aMJC4=;
        b=uCFyyevgZrbUxOHgLG6m5SdkzwasNFGp/6fgj021DYJN7+zecVZM9H6FhKHw8mwTWF
         ZT/xkHKx0hTp7SJ7ZIC4TgXzLuOrV+DtUwTUkIKKJcKegWoDIzjgG8AUrVHsUxn8419z
         7LYBc62KHmW7Qb3T35M3stlSPKBBJtTqY7YEyHDNEJvQWJgm5SbYFlE1J8XZrCwcM1u9
         eU/PiY4iFkA8tSePT05h7kLfxqv0shiOe0sJtsMQwniyK7kE0XUADxGjjvmcmV/NpyFX
         dmQ64nDHCHoMk5V03Tw74V3Re3y8A1Uab4pAKQAGsXI5i8g2p/gLtZL1do15mr4FYiQc
         NNag==
X-Gm-Message-State: AOJu0Yy2oM3xxYvZFQMjDyNX6hI9d1bgWn0aG7rJYRhhdQq0BvacYttm
	pzwqb+qn0LgzjN7x9Z6DATzfqtksOIhhwpYc/Ottlf0AEiFR5Ry9s2eWakY679KLSlm7IePfysx
	2du5SiRYLsdUQS3GMEfW6OZWXJiXoAilevaMxA7M33n3lOw5tOEUkAnMnA0Rv5Ec=
X-Gm-Gg: AZuq6aLRCx+l/Mumy2K3I3Fd0i0SldxeKWNM1kIHct54EdCZvrozSrpJzpuoOxx6FXD
	b64+43HZRXyTUamab2nGxduEgk+t1+5bo4CVeBXprU+BAh/3Z//VF8MksvZOnmnDBAcRlzHT6t5
	NzqW5ArWnG0Jr3z/dnY5JgcQoBNUru1X9h2Bg9i0HgayEaH1Iflh212G3Nf3u9I3EBhC/fttHlE
	twDYOiQnrtp7lAU9N4x4KPmM+ZguL+ZuOY9s/aEVMV/4jFKfnnIdSRMlt2vQBKpZEXMd8jkGbl7
	l5SoNaXRpEmDToqRNr3hVAffyU+JrU9MPIB9RoHR3xtX5dtNgSQAqpfrOuRgSog8lIa1z9hMXFf
	X0IgGE1txzHDYeM5nYVZwpk9fdghrSNc0jy/k78I469kA+dBlqdelY0dCu6TNH6Ty6I1mynSk+M
	aJ5PYqzBd6SabL9gqA5e/GLTE=
X-Received: by 2002:a05:620a:2197:b0:8c9:f996:8203 with SMTP id af79cd13be357-8c9f9968266mr808623685a.13.1770023487639;
        Mon, 02 Feb 2026 01:11:27 -0800 (PST)
X-Received: by 2002:a05:620a:2197:b0:8c9:f996:8203 with SMTP id af79cd13be357-8c9f9968266mr808622585a.13.1770023487206;
        Mon, 02 Feb 2026 01:11:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481c22sm3401897e87.10.2026.02.02.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 01:11:26 -0800 (PST)
Date: Mon, 2 Feb 2026 11:11:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260130
Message-ID: <cwzz5ndtvkr3dqn5xr4erfdhi2pb7xjijcu3c23pdpfgnmlyvd@nuvbtkakxile>
References: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
 <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34lnv35rbicqk6duyqhhidunulcipttsj6ryvzw6embgablnpl@gh3wtsknmcma>
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=69806a40 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=2b7Me9ADDCpIAGoeTPcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jbCpvyGnXRIC87Lrx-9aoOSaXpAw4MZ0
X-Proofpoint-ORIG-GUID: jbCpvyGnXRIC87Lrx-9aoOSaXpAw4MZ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA3OSBTYWx0ZWRfXzhFflNlorqSq
 guhAhvysseD+PHT4KombQ6yjWSGfxY5ILqPQ7FjJ0H/WWJ4Rq740uYfuVLgvgArEICuarX/5k50
 35/+usPL5UTmrQs37EgIMbPjKuJKepsuGkVxvtZYsnin/RtZpkoI7mOyYgkW+aCS/CnN96iSTLJ
 9LQIsFfJcDad5R+EQsjZ4KzFGEMGGf+da7MswldOdYHTmMcMm5RPIKg0msmGfgfw5VMcd8gmpVx
 b4GjdYc4Ani9sCvDl8yUxDEWWqgonbQ1sO20sJBeQ8GkWB7Qv+rZdDPUGf8mHWVzPW5EDinbHVs
 F4JFCoScWT/hs1UxulgkoL5zVqKELq7JDM8JTT5P2HjmgDL3w7DH2NgzcQ27QIyfGe96BOHXqb0
 +S2yxPI6TzM8F7B1urlrsMRR4eZ6bx176gd2eQtroPA5t2vyztlIr2mGQymn0osUJWWb4JNy2m7
 mu4vKn41ZvZzgrIIHhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020079

On Sat, Jan 31, 2026 at 08:39:57AM +0200, Dmitry Baryshkov wrote:
> On Fri, Jan 30, 2026 at 12:29:48PM -0800, Jeff Johnson wrote:
> > Hi,
> > Here's a new pull request for ath10k, ath11k and ath12k.
> > 
> > For ath12k:
> > 
> > Update firmware for QCN9274/hw2.0.
> > 
> > Update board file for WCN7850/hw2.0 to support:
> > bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
> > bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255
> 
> These two were not a part of the previous upload, but... They again have
> board-id of 255 (unprogrammed). Why is there no calibration variant?

Our engineers clarified that for the PCIe cards with the programmed
subsystem-vendor and device we don't need calibration variant even if
board-id is 255.

Merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/899

> 
> > 
> > 
> > Please let me know if there are any problems.
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry
