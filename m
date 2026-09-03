Return-Path: <SRS0=6AJk=G3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8CCC61DD3
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Sep 2026 11:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF0981F00A3A; Thu,  3 Sep 2026 11:55:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788436545;
	b=wV+p7xmLphrZm/32R4unJ6MxOWO2Rz8PflveXKJKOwmW0mLhcP2R7AMGmDMX0+R2j2+k
	 XTmJSldLs6wYe/3PJDnOZdcsq5mvJFYAH33Y5uj2ku0NaQ6zaZhJNk1jB0E6Jp95dFVyt
	 2IXGAZfVsmeE/9lV+4u8q5XgBhk0TS2A6p+RHcWdg+fEQLFURAXKymDLw7BvalJksWY9R
	 edcZx3HIg/n34pRRjkAxvWC9e3h7adKAtZBy430J3x6eJKD71IOWW9aM7AeAUc+OaEb8Y
	 Bm7bolgdBvGqvCaLeZuAtAxID8bLqMH71ClAGyJVMyX/cf+tTqS1quicGVq3iqjQYWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788436545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZYgEJIhZuuPX79zV3Ll4/ayeNTSStiJ9iTmWJqyHnpo=;
	b=2QvS8F6IwMSNWwPkbFC6F2dHp4RgHflnNiyqZagjHwZjW13Y9ZpKidNAveCaiaYBA1Ni
	 upf5/PUCk9Lh6zZaOoeFeTki2103kVni366JWXVjOJksRxwGXuKYOWhQKfCkcB0FbsSQ3
	 cYJutQBavGPFaeF3rXH9WcSs9+8pP/wPSove/IWOpIjEk0lky4uCXiui44HO8ssouy/z8
	 Or5s089XpW/5Tr8OAqi1NnevEDzwLZMYm51LWq5ivwmJFyIzVZIqrnDmUbfQg9y+CnAZx
	 FyFO1+wQ5smoc6kB1RDiQ7MLx/c2W+4+BzrDsWcO+VEt0fmq9T2eSugWyRmJmozsXbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRvqKDsZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j9dY8/g8";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 092391F000E9
	for <linux-firmware@kernel.org>; Thu,  3 Sep 2026 11:55:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TRvqKDsZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9dY8/g8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 092391F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683BTPqA210519
	for <linux-firmware@kernel.org>; Thu, 3 Sep 2026 11:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZYgEJIhZuuPX79zV3Ll4/aye
	NTSStiJ9iTmWJqyHnpo=; b=TRvqKDsZq9KxZ0EvSS5m/uZS6/jA8LosveFL+xp2
	XBFdtlv8WV+Y71H3e8t6u7HNDzQHsgHYfcD1wmxxBsWKwXSW+mezmzXVDHr9Zhy4
	48+qWC6/EdI+YDFjWAvI3DYnfHLCqM8R0t4h4XQ4fZgu9sOMIqn828J2QVU0m9TO
	87N6eJlhEDOqJ9l5VQlxt40GTb8l4Q1n8t5Nnz3V26WB61DK5u1d3vb+Da/a0hzL
	UJWZ0Y3gHeXBhuzDHubFwZjZQaU0itYcuAmPgh0j7EIYrsTTM1bb65i4h88XDxz5
	BSfYrY8qSardm8Sb91ca76FXgPwqZUnLMnbIYMcrjklfmQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82k831d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 11:55:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7866c4ed349so1845915137.0
        for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 04:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436543; x=1789041343; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYgEJIhZuuPX79zV3Ll4/ayeNTSStiJ9iTmWJqyHnpo=;
        b=j9dY8/g81ysuOvD33l+Hq9c06eAZNlQ8qzpWMR3Swnn2/9l5tvTX3qJVZga5ycCP5O
         oS3xEqlP4GBLq/46L5ZkY1htUxwDB+wN9BsqoaUoxzJEPgmckUo7ih9ttujYOgQ5Gl5j
         f95nUZLt5lzEO60r6sL2zsZs8cZ3iH+yOJ/OjL10H3u73oDZrHtlHHwJHgS0Kn6ZYqo5
         oEbZ/MOALlUH5iEXjR5ualbhPH6/Q/PG0ZK4SLfoR9jJtp0fgcCCy7soCPIaS9vykAzQ
         NCG3eHqhqr4jGQStC0jvlg9JCo0nMyMsLJaw0uVEF6+nFq1NaQqxF0za0AwZpw5kdPTS
         BCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436543; x=1789041343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYgEJIhZuuPX79zV3Ll4/ayeNTSStiJ9iTmWJqyHnpo=;
        b=f4GFDqKnOi4bm3jnyGt+qe9HX7sIPQJre2loBObwweC3ACp+1XOgiYD3XFunCKv0Vc
         jcTeT2gBEq8xxp1HwGemcGjF3KBOicWUEDyDZ3mlygddKLKb2zLlbt17eJ2r23deD2Zi
         jkfqXJDZ6VEK7CmpK3mcxHu0wXMc/EhnV2roXYrFNo/vNbZkBBUqRvWN2D5jDdrvuwMY
         MjL8EA/MTj0FBdBmdY0Pvu5Hw1g5Umvr2k8oktrelGOGpoqoUdcSbLB8S8Ne77IP4D02
         /rka55VMAxPGWWvPO1aJe82FvBfMnHmsee1hVWurf1tC97zrnYUfRRIlqr+4UFP7sk7T
         doJA==
X-Gm-Message-State: AFuF++kK06DT08MsyE8KAksNlbQtLqnu+UBVpB6tWKbB5uvDbSsVpE3t
	CmcF3YRwF1y99zcd5UvS0zY+uzV4NuIMWu9ESCGseSkpiZbFb79Nwz3jsVmgRWCMfyuZyyRXV/U
	4+I/mNIsOASZwF5B5Ig4KOrwCDqSDvvnbnhg8KzpMscBrENONH7QCK04nGBRWgGCmVSwS57o=
X-Gm-Gg: AYBFou3VA32ZlgpIFcldr2BmVPRQ6VeR4Dk+6yxCxgaDSOGjeX9c/WgI1Q7b9vmSm38
	8FW5NZO+Jg3S37U5bXFrIBb0r1PBy6YPOFKU9mo3xYYjseMvGmA6WOv9MHzfbpsxP1O+XpSqXqh
	Bn9IUQTteXWh9HWMSOSofCw7TKr/s8ToBhSo0/Iq7z5jZVn5RuXL+lmfaGnGfCAFE8kEOZJgrMw
	ZVIgBlQES+wB9IZrxuYsVdsEKZgyncRhswOADtBryUZBAaaYWudWGN/YijkN3t/YMZfjDAVaCT5
	GYcyw9xbCBEXwxMQdU3ELBpysiTLALXHb82dCNDbIekla9EkAnG8Tvib1lVQsaUlNh9EBqePUNm
	szHi9iOcM71E7q/vTH/SjwXuFgXg0qltJjLtiWg4VlJxNrMf1Mq03pZN+5vcDqT2jFngoUur4O8
	gidnWUmxqBhd47
X-Received: by 2002:a05:6102:5093:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a1f38875bmr4253294137.12.1788436543085;
        Thu, 03 Sep 2026 04:55:43 -0700 (PDT)
X-Received: by 2002:a05:6102:5093:b0:785:1a50:3f56 with SMTP id ada2fe7eead31-78a1f38875bmr4253274137.12.1788436542551;
        Thu, 03 Sep 2026 04:55:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a9185d7sm12733051fa.11.2026.09.03.04.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:55:41 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:55:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Subject: Re: QCA: Add Bluetooth firmware for WCN7750 on Maili platform
Message-ID: <h3iqs33onqhedpwryihvha7nebtdccfrvnttzfusvrwjkof56w@7vfkegied45l>
References: <cd7caef5-5d32-4751-a536-8a25ec3bd7f8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd7caef5-5d32-4751-a536-8a25ec3bd7f8@oss.qualcomm.com>
X-Proofpoint-GUID: tRa5HEOGgtJgV_P7piKJrxI1v8RKYcMS
X-Proofpoint-ORIG-GUID: tRa5HEOGgtJgV_P7piKJrxI1v8RKYcMS
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99603f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=HCjviXuoBfBAXJb1ckoA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfXwkKrPofwukuZ
 XGWc+Y+U2grEZa3zPBpP8hkjRx1GGhNIxgf5pl1TuBYABPWvex+UdT1NcfxItrFWaKzd2pkfCz1
 vAvVyrOf5+OoVhfQWi7Zyj+BF2WI2T64tszo6/3hQcfRFX37rkxkjc9nkQAuyqXzdmb9Q6fC8N3
 deAwRrxyA1ASAPClbI5E60RpUtFLL2flajKyDE532a7Z4o/UgWqocMjWQEepiI1XMCissG+vGMo
 64wXWfMjKa2N7KL4sgEWyL7fjb+hu7tKCYe59uhpckkJzPwC7Nw/lkVhI/EWsoDBa05sPAGwQ15
 qMJVUTg/cTqWDQ+TFSJ958TYA4IVL7c7cLKYl65bLV3MwsJyrlS1X7kbOCMJvNVh7WbJJAzBUPd
 c9F6yuiQKq9XT68W35Lc3mxzxFJBVzp56UmLaDvv8YIDv8wJ7Q/GL2qw2QgK+kT/WPkwgdTwS1q
 jqNk0qCwL7QlQxhj8wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfX0JH5PxE5BHWD
 aF2ZHekXn2OsBhgBTTJAICsqGyybKbNPVXr5JYcfv4mJSoNDdOchldCf+oxgrkoA7ptioTOaZ3t
 oQusnYbAzsWHXF4uRo2NizXGfOjKcbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030103

On Thu, Sep 03, 2026 at 06:37:03PM +0800, Xiuzhuo Shang wrote:
> Hi linux-firmware maintainers,
>  
> Here's a pull request for btfw. Please let me know if you have any problems.
> 
> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> 
>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/xiuzhuo-shang/qca_btfw.git main

Repo not found

> 
> for you to fetch changes up to 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c:
> 
>   QCA: Add Bluetooth firmware for WCN7750 on Maili platform (2026-09-03 18:28:54 +0800)
> 
> ----------------------------------------------------------------
> Xiuzhuo Shang (1):
>       QCA: Add Bluetooth firmware for WCN7750 on Maili platform
> 
>  WHENCE              |  13 +++++++++++++
>  qca/ornbcscal10.bin | Bin 0 -> 744 bytes
>  qca/ornbtfw10.tlv   | Bin 0 -> 224945 bytes
>  qca/ornnv10.bin     | Bin 0 -> 10837 bytes
>  4 files changed, 13 insertions(+)
>  create mode 100644 qca/ornbcscal10.bin
>  create mode 100644 qca/ornbtfw10.tlv
>  create mode 100644 qca/ornnv10.bin

-- 
With best wishes
Dmitry
