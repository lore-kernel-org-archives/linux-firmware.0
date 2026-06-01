Return-Path: <SRS0=oVa1=D5=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762E4CD6E60
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Jun 2026 19:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DE791F00898; Mon,  1 Jun 2026 19:29:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780342145;
	b=B5mJOymPtP/UVOCjLtdz/cdd0cWS4htIEJYY6tMi4cBw+gfCy5xNkmLH8REgkxLoVxzV
	 Hv8S5DWIcp8Yp5hFdNYXR5dS8GeVAwHwTwUs6cHCLrrtv0dRzBzNT03V2F+bHN/QnZhSz
	 Afe5vIX3dRs8lxKukw+KeDRU3DNM+vWkpSh8sm30O+IGF4Z2H2kQBFeDfCkq5IjZ+pjav
	 naUfKT5lhxGyCkaK+0CdSBQtRDBLZ44vr7IhH7mJTbX8nMIfuP7/su/Yq1QWgLNHx2ZAW
	 PIxUnQP3Pts8tenLheNMn88MlE5y6ztGi/zxBoFF1lev+HqqII5wInhIyr9QDVuFabQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780342145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CmOYPHvCLnFaBjMGEU+ubt5Sl1e1O82buQwen8xDD0w=;
	b=c0Ve4vKZYZisyOouAAC8oTQ+7XhA47w3HmKbCl2s+IfOCrcFYYoRovH3B88EjZN6xpE5
	 fofeYGlyJliTfa0A6zzTaQ/uftaKi01vaifjAtxZFEgPcFzalz2yuj2mmaAaiug/3agZK
	 bGsYmwfhs0AiLCHjjPZwMH8VrNwewAVzOdkrNo4ZQLvwYens/t9JvP3GBQsEQBi8e1rwy
	 dqsuelfu7HK98PvJIt/tZ/YqRo+P/pfXONmbgBy5ZpogXUk2+AlDtsl5jvuwyVfYA1Zfu
	 ohOpfFuMh2tYgDRuINzBGKRUj4HukL4fCDNBX86rr7cB1lOEwAuhlEqndz6xccYil2g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8UUV7cJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQLTyjIg;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FD4A1F0089B
	for <linux-firmware@kernel.org>; Mon,  1 Jun 2026 19:29:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R8UUV7cJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eQLTyjIg
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8FD4A1F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651F7C7U3563632
	for <linux-firmware@kernel.org>; Mon, 1 Jun 2026 19:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CmOYPHvCLnFaBjMGEU+ubt5S
	l1e1O82buQwen8xDD0w=; b=R8UUV7cJH3dD7Jd3ZHjmoASpjqoo93cc0k00A2XF
	3XmqlMYxS+HRNYRN8Q3/Vbwea8YswsrOzi3OD2CqGN2/97Irh5negD2+e1nKkqPg
	bvMswh3Vx0526fjdUOsAnEZOL3voZtFJ582DSk/0HjxOslzn3rOBVstrO0sfOumU
	MOV0GN57MtAeGrGpdFqvZfgN52yYkD3xJj8mN4JYrBjC80AlxZu105+Xb8Yi+1N1
	jz1UbWYNYh43ba6dfJ0X5x4cUtxUhrze9kEN5guW40lBwOKrdJKewRkkrO135KoS
	W3N+3Fx5/NVwk/92jJjGLVQLVjySOOchGBZmOSaCGGwujg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxts4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 01 Jun 2026 19:29:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfd2462acbso2074251137.2
        for <linux-firmware@kernel.org>; Mon, 01 Jun 2026 12:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780342143; x=1780946943; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmOYPHvCLnFaBjMGEU+ubt5Sl1e1O82buQwen8xDD0w=;
        b=eQLTyjIgmd9+qia32uqQp2bvVhVq36Bg2Wg58OuCRVXi9GTbd0hq3uncP+2U1rTbsR
         8/tUbYK1AgUvMhHjXh0PoJ6B/d7M5X6Mf+M4mBxPvDIDyEzcdAdS4CSJ8rBcfiO7gw6N
         bVUQbopGfXSury9ecrMDCeaXKW/Gjky/U3ocRP/Y0GfOfKRySgUi6xZeMl8RTe2O0Eak
         Y5CIWeeTa8KdjgBHkZVG38fdczcushAspgKceCCTo2Xhi8FDGMRthKWKHV9maZGt6piS
         QZ/L9X+RTkFq2/tgTAJboNt6N0Yko1qkYdV4S+P/nvxBndAR2u8BOsztemkdxBiWP7BA
         yAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780342143; x=1780946943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmOYPHvCLnFaBjMGEU+ubt5Sl1e1O82buQwen8xDD0w=;
        b=sgskQS9UNYngczlxK91RRx/bTZtNVdyX6O1HPxZVK2kPhIQgiuJ4AAJeQdwsCbFT06
         Z1lKl0qDr0PZFyZpFKhVFPZgdXDhT69t2NnJq9SlaG2fPVIa8ACodbGPntQuuwyvlpPG
         XW0g1Nqx2UFhvVvhOizJhDiE8BgEgJ4nQyywq2Y2fjMSkFK+OqkfOxyD8fqPkruG4CSu
         CRmx3YUNZeYmWJpRyynJ2T1me+CFzHC/gX4TMU73LkClVvvL8I2pl1gXPLt/51oyWpYu
         CofqcQISR+2Rv4cRVraEf99GT5LzFZO8shC0Czua+DYy8eVGjTuwYf7Cb+4poAmuJEdn
         7+xA==
X-Gm-Message-State: AOJu0YyeJummqWXeQLAWB6vwmvlB/qbwKna3ECNOj+Qru11djanL0/hh
	2j5q2SQbKF1MJla32rQ42oF7Q8QT24YpYCR1to6zGqxK4XWviNUcvhEdl+uSdK++NlBprTe63SW
	Yf+g+lJdZIrDWutCJc0KjlwTSi1JV50jdJDaQXGAl9wffDKONLTtFQjHFoHMSLBw=
X-Gm-Gg: Acq92OGxDrBDCmiJ1qMuDr6eYhmEMLz1CGjRZe+WSAZ9Ko69zz9TCmFUt5sNSZxkz4G
	voSmuu5Ow0oEuC4mq6BPtBk0GrK/6lhP9kVntGKKrV/SjFPqejeji98XCnrgVrt/L7RlePzYNYA
	+iE8Cd4SBXtkWV+FYp9epbPL+3MSBWuoyhAJGZquHRSaGHFUJOGj2jJg/agFaN7AOhist23ciyF
	99knl6pahxsTfo1xtAxup9z/0sNZ/GpoHE23objl+KKLz2eO5fZQ2azjzubjlxAL5YFZPntqYNw
	rhi+uoddtujiT80PssTz8oIgnjkYhuFyo30C7KenWGdmrucxXrnoCv8Z/qLnuTtXAg4xEsb7qHf
	nbo2ezsk4gMSqpb/14sA+vxB0mwzPuCZT379dg0dPlKz2c8ikPLgoyMTqF8Y8xW005sf2h4mKfy
	VwXMLMTYOA+CHl7vstV9ZEgRK5nFiSPcnIcxrRj5XxKY7rFQ==
X-Received: by 2002:a05:6102:6cd:b0:660:c9e5:8d95 with SMTP id ada2fe7eead31-6c69a5eccc7mr7011739137.12.1780342142785;
        Mon, 01 Jun 2026 12:29:02 -0700 (PDT)
X-Received: by 2002:a05:6102:6cd:b0:660:c9e5:8d95 with SMTP id ada2fe7eead31-6c69a5eccc7mr7011717137.12.1780342142344;
        Mon, 01 Jun 2026 12:29:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39659de42edsm27113071fa.24.2026.06.01.12.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 12:29:01 -0700 (PDT)
Date: Mon, 1 Jun 2026 22:28:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Simon Trimmer <simont@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PULL v1 linux-firmware] cirrus: cs35l56: Add Cirrus firmware
 and mappings for various laptops (20260601)
Message-ID: <v5m3pu6ib3vb7l73mqwlnvveatu3paodakwphonbto4tzxal7r@kmoidqhy3gn6>
References: <005a01dcf1d6$e7932db0$b6b98910$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <005a01dcf1d6$e7932db0$b6b98910$@opensource.cirrus.com>
X-Proofpoint-GUID: IkFPwE65ypgHlR83R8OAzhDNMUS2zrKf
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1ddd7f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=p0WdMEafAAAA:8
 a=FEDAdA5cxiKKOzNotEkA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5MCBTYWx0ZWRfX+F4LeYZpI8zr
 4ofsFrtnqwSwjWJADB0ZRZ610JEKaRwPj2QFhVq3MM2vu9n4uQI4T/UBPrMCfUiMFcosjid+x1j
 5L2kQJntCerV6DKinjYWsXuZNT+k31BeRbD/QPeZMuggjlPhgjNjCCCq1814j1M9bwWHUbKtixj
 QXwqNUnaJcqBV0VI4l3PLKLJABsw1+4qYV9OXUlPWL1E0kR+VHzTMMX3lkAlaWfFmwBdOJLxxTe
 1TR8D/tymYyciJLOYIsNqHgCYrq7RHaNiVNcDvPwYXNXzk8dTaqX8FwlyWPXC8VV11TVVAo4ZGv
 98/ctdMRPAxnv0roZvhu43MiFNLLTWBxOIcMgtSiBFgCdH6/bRY6NJWdmkqWkpIwbcTmhe+pQsG
 N8iIDktvDa10IOMNC+fZymXjgOqfkgbI9wK1AX2oBlBen6LkNSYqqTLgvovIp0KuHBT/Ce03C6e
 8fxh46wMLfgljDQaEOg==
X-Proofpoint-ORIG-GUID: IkFPwE65ypgHlR83R8OAzhDNMUS2zrKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010190

On Mon, Jun 01, 2026 at 03:57:02PM +0100, Simon Trimmer wrote:
> Hi,
> 
> A small series for the first day of June - we'd like to add and update
> firmware for the Cirrus smart amplifiers for some Lenovo laptops and add
> more firmware links for some Dell laptops.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1069


-- 
With best wishes
Dmitry
