Return-Path: <SRS0=Y73k=CB=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620A8D39403
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Apr 2026 09:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1DA8DC2BCB2; Thu,  2 Apr 2026 09:27:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B473C19423
	for <linux-firmware@kernel.org>; Thu,  2 Apr 2026 09:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B473C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328dA9r1249516
	for <linux-firmware@kernel.org>; Thu, 2 Apr 2026 09:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mIWFkWYqHPOTDv1OXI946E7p
	UAATQ+tSSQDpRCpGlYY=; b=Ykh/fMT/mV27c+U3+6y/3xGYfA34dq+B+gm2LsCr
	JAVc8R0Z3biBh+6zttRLlA7vYTa7F4IPGH9E29Ux+HXlk+VhuDFf/o2Si4hg+rP2
	3tpI46H++4USNJkjL9c08FaafFvEG6ZEFFnKKNVMQbpCgguMFZcIjF9wtC8M9MEE
	IW5JdVV/S+X2huvHphiU8jsPVxreAiGeAlcCtJqHNO3a3eeQsesuICBD6mW+IlgG
	xQImSISYZXdbokhBUIR38Pmdh8PP1Lv20bwSTqgo1h3BiSfWNq0mWcO1ZQNxHED8
	+3SgKX1p7HO+EwLG6Hx1Ga3P09HXPuC4fkgjprTsrt9A0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t06nv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Apr 2026 09:27:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3568090851aso1456946a91.1
        for <linux-firmware@kernel.org>; Thu, 02 Apr 2026 02:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775122049; cv=none;
        d=google.com; s=arc-20240605;
        b=EiIxz5p30TylWivBLw2k1M+/YHhMnmfRQv4O29yVG0PATX71thrEQRb4DRwey8cWw9
         OzPU/CSQQJsCrFnbmQ++AzcV1tfwOfuwOebHQ2+QG+W4eYhUJvTKWWUC/zF5M80rEtKx
         ZdTyE2uNkyI9MesSRvXA7Lt+tEZjRfDOQP3q42eIM6HkW5lGfd3MJSoW/0zrKpuz6MZv
         d53aTPkXm3o32ikkZu9ZkUxbZ4lAGpj+nqI4rvj8fGkrMKjcN7xrKkHjiHYGQd2w9rLg
         AfnJ+oSqW4wOUjYMN4nzOSnuWGML6MjAXGr0AQCeydNVPuDC26HFMPIMAz3XG8mJ4m3a
         CiFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mIWFkWYqHPOTDv1OXI946E7pUAATQ+tSSQDpRCpGlYY=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=Kdj9jcD3rN7X8Dw1mCnSxhsODCsyrLQy49YT0E4cO3w0OtBTZBBGyDn4mX44xQSj/j
         wnewCQX901BMx+Hi0fPrrr9OCcZgh/jrV4nNSZjap9Df6hKmoaLa+9DO9E9uwMn7iiol
         k9sC1BwaCDhqcXZ3YrSredpb3jDlKs/Cb/dqb1ZfYvqohb9uu92XJpWy6nS5j9rSbh2n
         Nv06lfdM9KD426UBCynILi2EeFWGuOLp45nLi4yj5PiHZcLH0G87K4PsBFWW3SzO/ZuK
         Wzf2BssAYKsMuCgZccyotuCX3SGdDh+FbNAUtMrrKIjK0rwNrxFrcZsOKuKu0I3IyY0R
         aQLQ==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775122049; x=1775726849; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mIWFkWYqHPOTDv1OXI946E7pUAATQ+tSSQDpRCpGlYY=;
        b=Ztf3qIjr8wsZIDD2BNDR2QQz9dLvAc9qkZeGBnRZCOrwuoHWuXy4/0GCa9ecUFhd76
         QpfCgnenr2F5EEpBcukmyrWKgDE+kfYXvjnKlBEAvt/itoE6+3DaEDX67WDF71iMb9Mi
         vvhtKVHvDAqp0ujO0uy0i2tsnjEoZB3k80JCURWxhnhKpo69n9fS1NGzt2vYhDRytjgl
         LmNejj8L3LfK2Gru6SpmGxTiFn/rO4jcE5POt81qT7I+1Pr5z3HkkJ7Ld0YJmuupqFLb
         uI3vN5jGolp6mU/pZvft63wk5VpmuFkG284mvs+dXDO8cvpyA3fePx5YjUwtnbdXg7EA
         vPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775122049; x=1775726849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIWFkWYqHPOTDv1OXI946E7pUAATQ+tSSQDpRCpGlYY=;
        b=GEM0oZlAdHDMcIJsRvVn842cQ8/+hXwnN16ydEUcU8bEWoGUfwlrTHZwozpI4Sl4vM
         8+SrVr/JWXvMWfEILSkxYFz/gi4jNmawqjP00UbMPg8TPadouMGNM8ms3N8dzL8+/rNq
         uKmBOn4cK1rMxRNCWboEXfGjh+tSJ6rhvcXDKjA0PSIBHmjBte3Z2LrSa/pNqKo9rsVW
         5R0oaZfJp/IVr2PH8cLJ9NVSIx1e1bI9rV9k3vdg7T8YbewBLYQRq0BRE8RchxuuMO85
         mcFVn3dcPp1uyn3Mdj9WB1UnEj6DbBwS0O6DP6wCAafmFe+89SnPitUyXe5gD5m7RQ3i
         +6Pg==
X-Gm-Message-State: AOJu0YydBvEHzQ8fPUZKltBHLExOAo0ki5rOVCDnqMwLnnfFpe7cczcy
	pUDXsIYtOhIv8TkRvdngxn0ovOGcdLRfvs5sjeo1js1le4lnDzFzPxw/eqQ3y8zs44XFCdtKWDo
	PK24rPMiDJscbeHmx+KjYPITyTqk+mqx9/yIvpDU80jvEUdNLZcPHA1kq9JyOK0NzTtkeKPGS7l
	QokJavV+C8CKbvledfsa0HP6JcVy4eblZv7rycPSaIMsOr4rOD
X-Gm-Gg: AeBDietg0a61s7QTjfgrJKpZ7byljBRpU8/4jep9eIMN3/RB5LCpbCcok9/916McMqf
	4aPIaMhvUt/7wOIwj8LSxSSv7ymF6nOfwqj+m+I84L6VCwIkU78K1M1C8i3JDzTV7+hNhwGseWz
	xHWDxtieQzPjjT+fpZ/to4H9T49p5HDe+KjSXMlB+zluuGp1apZQowW+IuaEK8p198MlkVOwYHR
	UIydOefLKdToO89aWqf
X-Received: by 2002:a17:90b:288e:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35dc6e7ab9emr6984055a91.5.1775122049265;
        Thu, 02 Apr 2026 02:27:29 -0700 (PDT)
X-Received: by 2002:a17:90b:288e:b0:35b:9720:98d0 with SMTP id
 98e67ed59e1d1-35dc6e7ab9emr6984026a91.5.1775122048694; Thu, 02 Apr 2026
 02:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <4b6c7b4f-dab4-4271-a7b5-8449b2ada199@oss.qualcomm.com>
In-Reply-To: <4b6c7b4f-dab4-4271-a7b5-8449b2ada199@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:27:16 +0300
X-Gm-Features: AQROBzCSR5murBRc76KRxOeSXwk5f-hI1up_fpm5TJQMKkHtcQMMRVgtN8xSU2k
Message-ID: <CAO9ioeV2GR7RVsJYs_5h-excmpgJmchfLmSjQBJNwh59LMHhug@mail.gmail.com>
Subject: Re: qcom: update CDSP firmware for glymur platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: P20TFrlXbQEEvXwOIFJsv4qu0WXkD0IR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NCBTYWx0ZWRfX5luhMjmgl2ik
 lsN3gyee2W19r/yzNETCTTmSe0BdyhklOxciJE0dXrEX1hzD6QVLk9xeSJt6d8gJz35ji6vYniz
 NG+4nYX51SXw13F8rJMtHRKAXy9PauB3zEs3kMnw9rzhqp2ie3EeHGILQuF3DWZnzaoTyfO11rG
 r5AXqrcw4DXvKQW+ctwfbQiibkwcz8Km6+Qj+Uo/rApTnC1zWJPUFHkoJOfAAVcPzIroPidtTce
 weJSIg3SXqLo9jt0m8wKJccJIrBvxjQuYZq2jEVsPyMMvL3d5qpdowxCMLNGRNtJuPLksoj9XRy
 BoKNBlrI0+tcwa2K7KWDPL+X8YGUTn9R0eBOlj8LCyBHI0rQVv/QzXyPJ3XuiMytaN+8StgsbkJ
 UjV8B2/rjcCfKQK6ddC79bLQgvESjgPKdc8D7Wxo2M6EI7+9egSvai+48Im4kZXu+tY9xkvm2F1
 qMx+xnnQ8cHWsBye8lg==
X-Proofpoint-GUID: P20TFrlXbQEEvXwOIFJsv4qu0WXkD0IR
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce3682 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=QkBy8h4xVI3jbaFZ6q4A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020084

On Thu, 2 Apr 2026 at 09:42, Venkata Kota <venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit 441bcf2eaa2a2dd6edbab83181a66a2db537c470:
>
>    Merge branch 'robot/pr-0-1774880321' into 'main' (2026-03-31 13:21:46
> +0000)
>
> are available in the Git repository at:
>
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> cdspfw-glymur

Merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/985


-- 
With best wishes
Dmitry
