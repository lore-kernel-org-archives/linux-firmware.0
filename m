Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE50606D815
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq+Y1/fk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVRGPfgr
Received: by smtp.kernel.org (Postfix)
	id 0B8AF1F008A2; Fri,  6 Nov 2026 06:07:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793945235;
	b=qk7zVel4PEgK0VhOpLZ1ac6oBMNA6Ci6v4gi0qbmanIbTM48rxhuekydc7ueuq6hBddu
	 B+q6KWH+RDF01ZwLwmhv7S7VX6U+NVBMiYhchkBaVTv8zDZytdG5L3OAfIWYx7uzChA5N
	 nJEwWbRV13r3NYpofY80J/RtsFF/PM5CV1J+ZLF7FMbh1SUFn/0GAYMtM6AxHWFuk6HbK
	 s3d8f7JvJhbIkF5rVoPxCAQjExjQHlLE3RSJbKiYFsLrqk2Ly1IZq1oqJj67akqlOHkf1
	 SeHEqfMHJVDc/muJJ4Q1lSkJe36zIoo3lx9cg8aIg8QjA8awTazTZJqIeTrON/9MSIQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793945235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:List-Id:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H+/qVJ1sGgubi4ux0zXZcSIIskvz+RbspUKcVltY7OY=;
	b=wKoCQ8rt68vvZJYnFDw9rWTWcbdHqC3ahVVSVT1gIKl61FHQh4XWg0WzViNsB3lIm4w9
	 uIPXw2ossFuLxxOVBsYeRnH3U+cDIPtU6O3J63VYoBkzqr5Aax4HrUmLSMxvon68L3bXn
	 YzBm1T0VIEdlAkkoXqW0aCd5CggyF9xEGJ2HjXjhLWifKlLxRIIG7cAas7jOGuADoczLA
	 svdtAjcrGwQqCoEimjGoJTK945rJ83za1gI8vDsIynth+K16KZHE5ut/f7rWyH9MVoHsz
	 LUSo6JSc+lFHTxo4i8wWkFs4mwCX1GFRoTYBgMgjoU2PY8MIA6SN6HKiVGg/FhlrYVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jq+Y1/fk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVRGPfgr;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F3011F008BC
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 06:07:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jq+Y1/fk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BVRGPfgr
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0F3011F008BC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6406rA2817531
	for <linux-firmware@kernel.org>; Fri, 6 Nov 2026 06:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H+/qVJ1sGgubi4ux0zXZcSIIskvz+RbspUKcVltY7OY=; b=jq+Y1/fkN51magVM
	3q//lDCMylOdqTdVJP537GxGluuSJZ3KCYmPKDopn+HJ1zzFQun0mDFhZlQciOeD
	B7NgY30C/7cOZbqHc5Yd8x3TLvSR6HJpRxPOxHc2zROhLJZ2C3iMyBYS/97pfqj7
	IBi8NYd74GPAIvQyMGDWvpRAIMD9tQCvshXRURaf665fZJ/y4Rtk1UrAUefID7io
	d/yRv9mJvcEN1A24iEwxT4vd/JK8DBl13xy/DN6mb+gbgz2z4Ma9eZpk3Olk2JDK
	0Txrl6ktSP/RKNCjHePm/GgfkwO3ZjygiGRgx2/25mU7mkvLMkxwXU4WGBHd+Uxc
	X9ffDQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa16jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 06:07:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd69a50ef37so52340a12.1
        for <linux-firmware@kernel.org>; Thu, 05 Nov 2026 22:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793945233; x=1794550033; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+/qVJ1sGgubi4ux0zXZcSIIskvz+RbspUKcVltY7OY=;
        b=BVRGPfgrEc8R0sLxNbnND0oixqpio7KwBJeX7kZba7ZUGViZHFEOHVp32iNRVV9yUH
         7As56I9yB3Y14VEMOZ8XuvHj7L5vZqOSzaE3PPrNMZfKzCunotZZIMhhZwKVPDV2X3R1
         p0V1Imcj/drd/KLea2vVonAdxovtJtuf1bGrjgtAqqXthARpAq0GOfGvPb6TkE4+gLjB
         Nrazq+oiAiPN0Nick7vgkannIUi4p2WCicMlJVVcwNLLEnUbWxXiX5og+qvtXf/An3pV
         r7O00+il6z6sgtOj/WMUl+jm0kxLqMa1ArBG5vOg9JPuxp5eb2CaFQexFeC+J8sU0ytB
         3RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945233; x=1794550033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+/qVJ1sGgubi4ux0zXZcSIIskvz+RbspUKcVltY7OY=;
        b=Kemn6ZJve7d4LUd5xa4iCanWnf43y97uJUpNXlXmI7Dxvi5FLvkqHgGHrsCKjJ1Kpf
         jiEQuH+qacPjg25GVFeA/GLW82KHjywo13SU+BX5ZwEOs0sRB5pd/22Lh5wm5N8BF3UO
         lX7b1LNrLhh/HROaKEufv1AMUD/3xIry+9wtaH/EohMD4M1cOARlxG0PlqrACug03ILY
         tVIW/SKiyzHbApp9HTC20IzdmPk1DBUk9o++5BJ+3Njb+CM6JqeYMYjQaWizadHMbWd4
         ZjOS5pjydzyvfpZ/Yc+JV22UTH55yGdnuh3hzbYTuaCCaZLU2/EroFD7s94wnkns+yI6
         99Hg==
X-Forwarded-Encrypted: i=1; AL+hErGu+pwOd70aD4X8AssT19MZLW5ADf1Ysd5bgrzWpNhBHG0UbBRH0BcRd3Mnx6UL44G1eYgT/IZqu9cDpuCFLg==@kernel.org
X-Gm-Message-State: APuU4Z+tZmj/m3rCFR4V03O6tl59/uSXVvyNjIgnytuUHQAnXiOJlxj+
	Wjms2pi1jY52KHMvO5n9enPon1dXhgjL+5iHWdPS/NFLsOLo/kYe9r9ElJcEdLpg4Xr5Krxa1mg
	zAlovAdtSyQAglkwJBwEQj5W+n/nQXPVmRr33xbYtx04bq784DEsiDJY0XTs14bTS3VomZFU=
X-Gm-Gg: AYBFou2L0IWDDH/AYU/xGB+IGMKAlJ0sfcMFqlK77qd2DymECvUyauQSdyUrS5P6+AR
	t4IWxhinuyEE67aaNWxZ2vjHh0Qb/HNh6/4LXTN2StYbIjoWC2+9vZ6nZTj3/hECDxsaf14rzk3
	bu05zPZvbAf6L39SiO1Vx6HJjF+wbEZohOHepohBM7Rwh/WqDVpkZ6E+f0HPtlMdIQM6Ww1M2CS
	L09vYCdWW/k+tv0FfjSWLLiBTgSiKBsS6+Dcc66CPvflCEbS424HM8JyEEx0JsUtctu07TpL3xx
	1xwsaDoC16/hnbpSg//Sp0l+w5q1HTHui0E92mbUg0RXavBCy4SX+ttCPkffGBGWlzYd9Qu0nUT
	xXTCBGJQp/njQLQzmCixKX8EtibzxIpBscO6rJR8OCtHqVH/KSITl3YC4bX0HZyjTlBb6C+M2zz
	WBqMkZZKIGPbk7Phh19AbgaHCrKr7gnyEr2DzCAQ==
X-Received: by 2002:a17:90b:2749:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b0db72428bmr2139239a91.6.1793945232632;
        Thu, 05 Nov 2026 22:07:12 -0800 (PST)
X-Received: by 2002:a17:90b:2749:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b0db72428bmr2139207a91.6.1793945232159;
        Thu, 05 Nov 2026 22:07:12 -0800 (PST)
Received: from [10.249.11.239] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e28ab337sm285623a91.1.2026.11.05.22.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 22:07:11 -0800 (PST)
Message-ID: <20247457-3e1e-4e59-b297-9e422ddccd55@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 14:07:09 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL] qca: dedup QCA USB firmware files
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
References: <20261105112700.21315-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20261105112700.21315-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DIuR7RJRZqj11gWhiwPAuHCHYTYTNcuu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNCBTYWx0ZWRfX9JcuoP7G3w2r
 mJpKCU1r7iDk3zSkQnNWtBUXGGQOliPwhMkJZWkhq+VhUlDlCTfhCPdF+cCwXjVeZPHGDux0cth
 3VY7t8FYd4fXYn2+oib2eU/Wn3hjcFI=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aed6e91 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=Zt7JItDJAdH93xA4AwAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNCBTYWx0ZWRfX5Hlcr+l4Ama6
 i4UHcLpszuoqQQSRaA1fx+NPtvb3QKuwIbq+uKJHoStbiqsWIzXuQ8Oz56FDKNRynhkhsTKYTEH
 wHtxP/zzMgHziTgJ6SrvERDAfAW/hAspuWL8rMnrwUo1/I+TC/OnPcwjgkSvxHgwp/dz03Y4d+C
 xL5LejKd5gQM/3RMY6ZYGxI9GC2ylHzq4U4h8uKlQ8Jgr/lOaXW2B8QhaaulQX8aIqTCEiduOjw
 AKNZmjuyEMUl7MpucWvVzd8M+ZXQYqZGcxuNNv1wUod0z7eyHDS+MCVhb7cxwOJ00B2QteqG7v2
 Egdt7y1lyQsAH0W3GTfl9Ff72nTlSrfDK0QfxpXKGxky0oYGTrVb+ee0podv+ESG0cCzUxEfuNO
 A5qOwmD3vEuHYkDjSFEdFfbs4MEdSJflnBSV2OSKCDKKkMtQ6JJDP+kVYQVh7b9Tswx1Y4D1xlW
 W5gLoUcyzLmPH8B3hzw==
X-Proofpoint-ORIG-GUID: DIuR7RJRZqj11gWhiwPAuHCHYTYTNcuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060024
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 7:26 PM, Dmitry Baryshkov wrote:
> The following changes since commit 703a4d95f86606b14b8433e7197663874ef89eed:
> 
>   Merge branch 'robot/pr-0-1793799659' into 'main' (2026-11-04 16:40:59 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/lumag/linux-firmware.git qcc2072-dedup
> 
> for you to fetch changes up to 1308e5fd64510223774218c0d1d681e7bfba40d0:
> 
>   qca: QCA61x4 USB: Link 00000201 firmware to the 00000200 files (2026-11-04 21:00:05 +0100)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (3):

Hi Dmitry,

Thanks for the cleanup.

For these dedups I'd like links to follow these rules:
1. A link file and its target may differ only in the board ID.
2. If a board-specific NVM is identical to the default NVM, link it to the default NVM.
3. If several board-specific NVMs are identical to each other, link them to the one with the
 smallest board ID.

>       qca: QCC2072: Replace duplicate firmware files with links
Reviewed-by: Zijun Hu zijun.hu@oss.qualcomm.com
>       qca: QCA61x4 USB: Replace duplicate NVM files with links
Reviewed-by: Zijun Hu zijun.hu@oss.qualcomm.com
>       qca: QCA61x4 USB: Link 00000201 firmware to the 00000200 files
  Suggest dropping this commit. 00000200 is for ROME v2.0 and
  00000201 is for ROME v2.1. They are separate chip revisions and
  should not share a firmware build ID, so their firmware is usually
  updated separately.
