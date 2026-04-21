Return-Path: <SRS0=nKjF=CU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38399F8FA98
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Apr 2026 15:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12EF5C2BCB3; Tue, 21 Apr 2026 15:33:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F1656C2BCC6
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 15:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1656C2BCC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9XVUf3164716
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 15:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yIxlUghUBKiCc8deiyZT8qQw
	fk7BrJmVDIuLaHQJzPU=; b=RXkr/ERU2gTXlqPP0N71+8Xh9h/qx33T85Pw88jm
	lLesSNNFIySLhS74zBasK9ALQN/0eXlBAdrlZ1AJ7H9XChtCVxteuw/tj22laSlH
	lOi4iD/SIt8LG/E7a0c9HvhuJ5i+33+hoMVgRZz0PFS6IxIC0uvL8u9AQm08JC3S
	Zvck8K34cvfSJ0q3mpBA9Q/DRv30EH7WPd7KRpsj6Wl7To2BUuQ6pfjX8u/1yE0K
	Y1SDAXw7rlFkPhpmtF5g2o7uTE4+J51JD4VgLyE6TAlx7/+AefqTR/IkIoFzKmBA
	Mky6cPxvbgW0VavzE84noEXdAN1x/M5b+U6InjAldgovCg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q817hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 15:33:17 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dbc56f5290so10373417a34.0
        for <linux-firmware@kernel.org>; Tue, 21 Apr 2026 08:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776785597; x=1777390397; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=;
        b=ez0rIjEZzIM7544xHsjeatVrLTQlG0r7/tSMlLseqt+kAWRyYdKkHk5EM8q9Iho1RP
         FwYtg08OuCLmYEnvG9TMT0G1oFQnQsZFVZGm7NDIdbTwtD1yC3yzjNqWUT3YdrkzcurE
         R6UFBnXqrIjGiq9c9TnkscwGSC5OMvS9eA2ZuNDFI7stdkfkLRkf6EoDDLrZzvdLcVoO
         7e++8RKBZNurwNXdUVD37f7v8Ti/7krEYO2OzNk66uNYZS3BMcI5i8RhrzM85EFngWU/
         1JZaCvUTYz7d0Z1eggCURB08KUKkSYJTsXaXb5EmKMF2nED/+YA0drIW77vd1PrtExk6
         XLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785597; x=1777390397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIxlUghUBKiCc8deiyZT8qQwfk7BrJmVDIuLaHQJzPU=;
        b=C/yccNxrROytiAAPOxfGlEakUdFUGYL4fBQ8c+h7A95gBkcNLJbME2uC6pDCo/ZN5/
         5sZ8eoQxyYehnuKsd8jIYKaI+QGtctJQHU9PG1DnTiDpiYPhjF3IknAy0XuwobRSatm7
         7WXUgKaQhia2PWfTYGxoMT5YvD82mkIbRGNywjsGlchx8yDQZ3mquoaptAWhyzknSFyq
         udw/A+JXlVwemOVFPrNV0jz1FZ8idcDlE39hSpkmxJMdzfATIFlklxrvmxGxMWgHNNfL
         7AzejogTlldPY3oeJGS8CokGhs8uZqsjLPvXa13/FVjcnqYIe+f9CsXQ4NM/Sd+9HHG9
         OFaQ==
X-Gm-Message-State: AOJu0Yzx9s5ZvKPGNKtSIjwxMd4uP70W0WNqd92TnfhtOSPZa2GNjkuW
	3/qWC+KLNAAttGtO/ZoO4DS0kn696IrCaSVmf+jy1Q3xge6OaRX6UvyiOvQAXgIoDOJbHj0QsNU
	Bt0l0EIoc8krccwir8kB+wJDpDcRZQqpPKH2+QTlz5egTUsMVmQ5/DSL2lPEvgBk=
X-Gm-Gg: AeBDieurl0KGqd2LD6/8XoKGENihmstL7QK2IsQeByYc6hV7S4O0DUNyHKR2HLEX2K0
	JlrgfrHK3YqG7AQ5qVdY2Kfhb5V+msDe/uB/PDxTO5MYfjDrRqnKr0FfwqyKnq23bhm6uUXWwDW
	cuRtlGWOiweJ36ulVEgS1BqehrL87ujcOvPBzW7mDz0WJ3tJiWdlQuInmcvqSh/kLsNVLNCOrka
	9AWtC8MWy7sxzcmR6GCeUFvl8IS8gLVCYu1ejo2l0k/i+6AY/of8ZhsAoPlQH1NRgxrIINYIn7J
	qfG71zwNQNhPm27owpul3TKhEgo12rqOrOe9/07/wJiulM/4XAJaNHgk5kOClFHRjHlThw4Abnc
	q5nz1jNk0cVyqfHDLwYB0z7JHBakIhNaJegKN3VmZ8kudOpycULtKobJjpz3nU3MfAXQj5Nb7hB
	/BcV27IClf7SvPfL3faYgnQs5OYFWChOOtFyWhlkKCjj+G7g==
X-Received: by 2002:a05:6820:55d7:20b0:67d:f88f:d853 with SMTP id 006d021491bc7-69462e2109cmr6917211eaf.6.1776785597099;
        Tue, 21 Apr 2026 08:33:17 -0700 (PDT)
X-Received: by 2002:a05:6820:55d7:20b0:67d:f88f:d853 with SMTP id 006d021491bc7-69462e2109cmr6917190eaf.6.1776785596615;
        Tue, 21 Apr 2026 08:33:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm3757178e87.82.2026.04.21.08.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:33:15 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:33:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260421
Message-ID: <wxnc2oczwg3hakkjxms53qbeckmy4oncp42mnqq5t7xs7lsvdc@4mmbo74zs3e2>
References: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NCBTYWx0ZWRfX2qGyzbaJP3CP
 w+CNk3l9oY0V4tuj5iUhpl8znJCTDS4tYVYsdmZjv5NsijOZrdO9/zyS1AhRss1UWdSI+E7C7DV
 W0rZgXsoBOZW41ayD9OyMrEjpWPmq1U8I4PKylVEs43u+azkVmj+coK2VtuZdkd/kkVM8+yyDBC
 p/4Xe++MDFe8lNR+qU7ORCkbkn8/F1rzk/u4Ad06m0xkT1zkP9SuSo8kMdbjBC71Yq3Y0y+dxBt
 tdwIp1xrpDa9z+QwrACKfafco2g8gcDezfWMlw5oFDGS91U+mfeE2tF679FMX7pKZO6h98SMDdp
 8pVLyCijh+UYEbbpgluw01wnI43+mxOq+i4ic7dAKI9m8YJ1/nylEmV/SkYgCBxekE6Q3u4zREU
 IvRGkulfT1lxMjt+ipSs5L/BoU0T3q+dv2oT7G2e/S8SAoO+nehsYZBCdhYprOdae9AANhPlVkL
 ZABnHtF77mxebdh791A==
X-Proofpoint-ORIG-GUID: E6l9ydQzgr2V866NnsCW7v8UtSzzBciM
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e798bd cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: E6l9ydQzgr2V866NnsCW7v8UtSzzBciM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210154

On Tue, Apr 21, 2026 at 07:36:08AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> For ath12k, add the initial firmware and board files for IPQ5424 and QCC2072.

Merged and pushed out, thanks!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1010

> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
> ---

-- 
With best wishes
Dmitry
