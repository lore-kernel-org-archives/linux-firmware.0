Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA676606A32E
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Nov 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyN9gePV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlW3xFlw
Received: by smtp.kernel.org (Postfix)
	id DCCB01F000C1; Wed,  4 Nov 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793800878;
	b=aIlmaVe96YNEIJtzaf3FIBAh6RL0tEO3ZzMvKEyofLYrYLly1O4ozyiGt28K3NyDebAb
	 x0Q9hNpbrm4kOxlESl7BYLVNivu0ntWJswANiuiGFF+onzAHY1wvRmxrrcOEodcHxVsSl
	 mYDkQKwoc/A/MFdv05/BJV8LiOm8p9+QIbsmZKfYu6bq7gTDf/4WGdgIJHtcg8kovyhPB
	 g/4hLa/sLHrS9JccXk2c2ScrEdkwlMkug1M25v2W+hvsLkCpe0eGuPrq8slawOAM7xU2o
	 UG55YihKYQWmb2FOTWFmMI/m4cxzmhObN4YN0sUSzoBf/h+Kf0plQ2U9pJnBGl7ONsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793800878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sdLfCaVdZtRrAcJXA9L9me39WFwKUP4Ncmi/hjrTXVI=;
	b=IrbVvoW6SX9QFh1GO7NnET6YdNoOGf1ErQ/ziqs5m2FQYZCYEY88ZcNkxc1Zoi7Fcqwi
	 5Qe9z3CNWYPNQ+DkQ7OBl6L3IUSuRSvj3VRy/S+R1ByzJDuOdQFVaKA3A6hBKFYO9MYl0
	 g0iWY6r+n1eUjwpkfpdNoTvcoCJid9JTziCukUdHrLeVBVigggSMF3cdJtJ99XdoBfyPQ
	 pUg5y9+EpM4RLlAKRzAOeyay+pqN3fG/h0hl8kAiyowiDK8fh7bmI3M2cZP2G/EF1uiji
	 tCGlAX7Kgy2Toe7h+t4Gwh7ovb6OCE9IesvVIfiuDBZzDf9ImXok0ee65Hz27uHbcng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyN9gePV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlW3xFlw;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 468EF1F00A02
	for <linux-firmware@kernel.org>; Wed,  4 Nov 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyN9gePV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IlW3xFlw
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 468EF1F00A02
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZoDt739132
	for <linux-firmware@kernel.org>; Wed, 4 Nov 2026 14:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sdLfCaVdZtRrAcJXA9L9me39
	WFwKUP4Ncmi/hjrTXVI=; b=fyN9gePVkE3l33VsG4tPK0OCUk7rgT7qzwv793He
	34gbRT5PuFHMWl0xWXF66JUwh3AwJp9q6EejjS0r+36gRyQwb2aVQumoDpR06xfl
	WQo4Fslyq1xDlinyHmjUw85ndFoUvuNr5XqjHgWEansrovNTY4tYyoC+/UOyKAxD
	16mhXPJ4WzCrq2VsZbib6fQ85IJGXc+eI1LRBUG/3hvDnBi/iMP0hs1T6fb/eH7D
	nsP9R/QhVFwEtTyED+RDEoTHK29oYBLqBSbWEwY/prKobR6UkaVCq8Yzkzti8E14
	JuB2JarqtUF8WEAdCaLsFBRa6h0oiJoUFoHf4H2A1lvnow==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163ha1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 14:01:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ec2ea00c42so562375e0c.0
        for <linux-firmware@kernel.org>; Wed, 04 Nov 2026 06:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793800876; x=1794405676; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdLfCaVdZtRrAcJXA9L9me39WFwKUP4Ncmi/hjrTXVI=;
        b=IlW3xFlwz1f1Xl00A0Akhf7PXYMrq7PMevGANPkwd8I4TuSEd+buhcfUzSFIqj4+q3
         heNmwemNNqoTPLf3zSs0I7oE1+C1XiwBZ7YisAI2nmW6B89XQ4yT+Awuld5v09D7MMS4
         0iRYul7l7NG/FFlc15Oe+W1+U0c+7akxIC7RIGz91sSttYzQQZ2WoWDfSg2TeTuGd+KD
         EozfI3yzNS4Yi/6mLvORtw4EJxCod0w+Q7wu/eMPkFgJtaFToHjdiVTAD4SVzXZQ9DUv
         SDcQCHI3rTPJ6g2UOeN90og04WTbf21XD0gUsLnKbuk761J+imb6iSF3i1FgQ+4SYd8H
         K3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800876; x=1794405676;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdLfCaVdZtRrAcJXA9L9me39WFwKUP4Ncmi/hjrTXVI=;
        b=fA6m0v9PiZv8OKzO55olahGWgoYgtdi8LxcN//j03/zOzl6gGZLSXm6iy8cRPDxO3o
         IuBibcVMyzCbuWDuij0+LOjyy+aiJZHWug5zzGzfXBgdIZybsdsH2fRrQhB0GBFz8Q1+
         ipiN0Xa6m3A7i1FnoKIVs0ZBd2gGzdLcfw3I0hzX0WAf89w1MpLkiztYho/F6lrRKlq7
         sRzFTrTzDx//ETym3w43j0vASDE31cpGhC2gw/GWjNllnWErWsl/QNsQbbtP/nJ8ZhAg
         rnD3+1fCgKlV4b6NMnJ6y+pRWwgpsSJ7oqJDh05W8crITrXLLA6qNFNNNcSYEwNlM55/
         vRpA==
X-Gm-Message-State: APuU4Z+VREmtyDoIN+ochwL9v840oz4sqUHQhCqCxqmIx8UcUvPnG4rx
	t2HkUornsngrHRkDuyKe0M6mlqZVe5+Rhic64NDP4PXQ96wkxAK25pSo/DUxG9jmLcsq8Q/m+EI
	yO5G7GznbGu+xykVMezYb8GDLUCEJktiIJQZ2F/PsN5RwmQoKq/6dgPwRg7f9wfg=
X-Gm-Gg: AYBFou2pJq4yG/Vh9qWUTsonigszkHKPL5/y4BVZST5mbrmPcRF1qXY3ff4P4q6q2bT
	yE3KHR0qbJdkUZmDt37HyJ82mKleFR6brXBzIW+6Bi7niWx2nNH7MbOUKuej22m9p2z8psOrTd7
	OOA4dHMs36QIBab/OLKIeoIkMqfhuf5dKt6sCs3asjAUN7SNSpgq2A9ns7OuiDQp958gDyINUnH
	XPnGbVpuxfW9nwiFRswVEr4MBq0/3m4X+uXp1/7lRx72/oBJnaxWOvbY/iEym97c135mOwYKuiy
	ECZwvJBxS4ixMRmATbdrF0OMMK3SW3xjGFFeErWdQ6M2PFolqnu5pHP8BAM4w09mlJ1uBKrLDbn
	htJnQxXzh+Eg3P/UFMYKILDNHqUPfJD9RB//eGJV2P3cg801gQBBuSWwmZAoBKjhr7yee8S4Nni
	XlPGY7xeMWOfSGNf6oyaMhvPD25mY+BOCvgnZjFoRBaOg03hhHmqOngakPwiw+
X-Received: by 2002:a05:6122:2895:b0:5ea:c77f:2f2f with SMTP id 71dfb90a1353d-5ec686fe108mr4524785e0c.4.1793800875234;
        Wed, 04 Nov 2026 06:01:15 -0800 (PST)
X-Received: by 2002:a05:6122:2895:b0:5ea:c77f:2f2f with SMTP id 71dfb90a1353d-5ec686fe108mr4524649e0c.4.1793800873965;
        Wed, 04 Nov 2026 06:01:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38cf65asm385191e87.62.2026.11.04.06.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:01:12 -0800 (PST)
Date: Wed, 4 Nov 2026 16:01:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: Update HPASS firmware for Qualcomm nord platform
Message-ID: <qmdffsaovcefv2oxrt6vr4qwisffehef4d3b5fozacvuzcfhty@5inxluvky23u>
References: <c309b1ac-a416-4a37-9369-2de2511e5d7b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c309b1ac-a416-4a37-9369-2de2511e5d7b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pK7B2UZRy9C6j_GIh30XGgicPBjUQAPK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX+C2auqgXJMeB
 n1dVAgp07wMRae4ETgEV61NJAXM8LQH6xw+v1QiW9fLFmtAJK08wIY0fz4yvk4c+OSZ+wFxZJeW
 1NCNPVMrFCTvZSiozK27vNsTwXzv8U8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX9rdHv/CQVT9v
 /ZrP6Ij82kLU1mwTa5FMwr1muxUvwRpl3/WCUzF0wVEe21Qt/O7CDKkkvL5J3+zS7MEiq+81mwS
 aM4HMtkM/76gZaG9pVhzWQ3UR3aSdY8Y4JTCccvw1v3SLklnPHfFWxfegohVYzobyqcD2UDUS8T
 11oT77fDbH0cpJLAfz4oV0STxPe2Q4psgTwdgbSQGK456TyH7H9jhtIkNpJGirNePypo+yKgjIH
 geGX9cxDdA5brNDhLzOcday9hiyvpqtoOZPF+3ogHTZMCdD7htgzB6VjjHvTE1qKT+E23b3hFtb
 dcSPDpkdh1Ask8yKRWK9aiYvzILP0vDcQxgVSMGuAKmhe09Mq31UNJVm/pnDcw3364QMlSL9qzj
 KeWxGScSKMdsZX7WsXjKrEsyUaR7AaGsOQW+Gf0zkzuJ+qekoKsk+JWEtMr+ANU9zDmGaNllS1c
 O3so5EA378YxQj1VK3w==
X-Proofpoint-GUID: pK7B2UZRy9C6j_GIh30XGgicPBjUQAPK
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb3aad cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=p0WdMEafAAAA:8
 a=xdV8z3sPSY1sUjnj_N0A:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:12:33PM +0530, Venkata Kota wrote:
> for you to fetch changes up to 4a0f6cd38a05c17295a0383aaadb2bb69b06dc5e:
> 
>   Update HPASS firmware for Qualcomm nord platform. (2026-11-03 23:09:45
> +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       Update HPASS firmware for Qualcomm nord platform.

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1354


-- 
With best wishes
Dmitry
