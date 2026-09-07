Return-Path: <SRS0=GJif=G7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC512C79F9E
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 11:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98D6B1F00A3D; Mon,  7 Sep 2026 11:43:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788781405;
	b=KDe7m4Gxzige1Q2U3mQHwvg76J0WsXxiQBaVjO5nIlRks+j1tdvObGy0cHt+cVyXB1GH
	 g9qFj4pHbt000++ZJdSG6XaN+o4ylKb922a8KMVR0w8Sr+hQufylQWXSjj255xFspvCxR
	 TGnn+hW5eGO+ezzOaaSJiFG2GozBmRSXyFxrfrTBh/ysBJ6NS1yS2mAVVM/c5CU70jcO8
	 C4TReAmdVVQqWUgBeJkLjpdkb9Gtw08qEDdzfQLqNBGtdUpyv9+oNUHNznIeb6146qSY8
	 Uo7sK0W7sIKz2PUtTkKudSYYkb0YE9Jw5yTX+zPVJy9+5je8OHRjweOxqjzKRfUWZng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788781405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bO2y0AamfIxIt96xtxwPZ7e6tSTK8f1coylauEoeRH4=;
	b=DFKlkCkujK33DPngp5JrsK4CpjRfIf7LMj7h2V5i2WJTB1kdlAUuF1YY6CkApXeqveQh
	 rFg36pxUZcb5XB8iDI8o9/f7qIFogxUDIk90k1RpdhHUV+u4uCUAfi7xDT7bxImK3xZSI
	 glwWtbdN9JLxp6mJI37zmj76wBXbxS3ARh9KamjfJLG1kVW5GDda6NO/5FnzW8sGOjCXJ
	 Rf+rH6+yFFIkz1tGAndtpMBeraWmHfFFbUqdgKwKxOViKIW1YV30H9B3fWmtrZgSO1jxB
	 b+7xg0JyXp5Yot9+iYPuwKL5J+jD6muxadLU4Hn8sgU8oXXlq+Kq9aiVuS/jMyDlrZw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOvhV9TG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FcSaU4Uv;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07E281F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 11:43:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eOvhV9TG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FcSaU4Uv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 07E281F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amul62652505
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 11:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bO2y0AamfIxIt96xtxwPZ7e6
	tSTK8f1coylauEoeRH4=; b=eOvhV9TGR/pzHAVTC8sr4iEJVC4lklZ8EJ7OPMgL
	6fnuh9JIwWLYV+eleWahmaRdlusPSBQNWyyOJPYta9B96lKoQB1j24R+fBXEmhCw
	oSzpSb+xP7r+kT4w/9UsCvtejuaSx7e1lvw8k8ZGjLFRVIlIJjVxDA227HL6jBBT
	TTqVrg4GDLHefIfxjSb+Nh7rw3WTULMJGkLlt2Z5hWCalbdVaNxoaTEhveZwzFor
	y99efq50PsRE/Z8XOJHBY3tJPe5Pc7PYGX1vMHWnujcAfup1pQishbHRoserckEs
	638Hg6sh2h0SDQTGB3exS58NZWfRFfrWr4z2saHzSuPrVQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0f6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 11:43:24 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c66c4fd901so4187334e0c.1
        for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 04:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781403; x=1789386203; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bO2y0AamfIxIt96xtxwPZ7e6tSTK8f1coylauEoeRH4=;
        b=FcSaU4UvrcYUbILKuL4y44c21JNs0U2GO22+9qGqX3qNDc2xFNvbY84aJbtjxxLowB
         KeUgeAjkCFv1yJXGLCmK0wcsuLM3yZIERzFZDXQY0a8o/bLcxXoAc1dyinS9nXcXbcKi
         xsz91xDWJQEgkBq++b+kEXiXwd3w4ri2YqH89O0TmPqqb+yuwWzJRXy3boQgo5/8S0q8
         nMLPKHn8tOiF6ZvFUPYmTdhEVqJ5zo3nFCZqxebRzj3hsOQB4QmecD6VXxW6poj9VYIA
         zFZMzbEbyS3qH+6xFG/g4rry0fLtu9+t9JZ5u9YkxxxHHsab3fphqLVxLLNUCE1XIay5
         PpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781403; x=1789386203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bO2y0AamfIxIt96xtxwPZ7e6tSTK8f1coylauEoeRH4=;
        b=bGWI7WiwnHuY3Spl2Urgq29poyoJVkWBqTkSI3v2Qy/IhhHeR9p55QVkSMulaC9ue6
         gr0o7lV06jOgTtvhYxE5VHrcfRIJKqeXiAtsoBa+lrbszgKuNDcRIuy2ntU0yyLykt3S
         WQNL5a28doSTea2bEz8pZrMUbgcU7PzavotfML5CCMfd6/RzvRwDs9d32SnUXAImgjZw
         Xd9R3bJY+yyxRmozHbgFErmFuu3T6ALbu07sZDAA9Kb4/MO8aGW54DaWze8zjxddnwpp
         YLgCXPDqhOi87iAeUhmBHyPTkIJElxZ+r+lJCBSle47fsi8qxl7aQY+dj+ZonA80KflX
         01oQ==
X-Gm-Message-State: AFuF++lF704K3snu9gmMel56uVCfX3OhIlsYTEAIKZxAf/6bki3hJGln
	7Fv2mMESGTm9VV7aQJNJIa4u1YXPI1vuLrPO0Ac+YtJs2IlcixruUEKqcdBiwthzy9kSGm70dPj
	SEmI9WlqRuqxct4bncFu+zmDZz1xxEGOdTgbYSdGnI8W009fUwDRpf/EBLZ7XBV/qfb7nsMk=
X-Gm-Gg: AYBFou0iw7TmDlqOabto35/ldrmVLPy9lYE0o6rtFzmRp7EBkIgbZpwN9C50m26jISK
	sVwxuZ915PXXBf82PTvtB0H5xKqC4TTg0PPiO2MzvRM4lDMVtB71VUn47vRHhdUqSZQUwh3T7TO
	IiIfGeCfJcohVNYIarLr4qb+kyKI/majqwOguv+Z1vDph2OzX58nCYXslsMbAHSSNWuyqe+z8eA
	iAMwQ4apIvbuFc693i3cUDw7PYHDChATCmL1YpDU62JDl9HV566w2MQcNDXHIj7IVSb+VHNfGHX
	CPnaAQ5jH9RoIhDyD3U23kBD+uQcg3nKbzB7RA26CIAirKexHK/NuxLUfzajamuHrXALz3sFCqx
	iOvwUOjOkjWl3NbBSjFSytdKc88tNglJN1NFEVAWUb5Hh6vqj1FsOCz5DQ93JBi6XQulkOAZkbR
	PoI6Yt2GBG7LPC
X-Received: by 2002:ac5:ccad:0:b0:5bd:fb77:842a with SMTP id 71dfb90a1353d-5c7ed836476mr8262377e0c.7.1788781403135;
        Mon, 07 Sep 2026 04:43:23 -0700 (PDT)
X-Received: by 2002:ac5:ccad:0:b0:5bd:fb77:842a with SMTP id 71dfb90a1353d-5c7ed836476mr8262364e0c.7.1788781402684;
        Mon, 07 Sep 2026 04:43:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705cd8d5sm26774651fa.37.2026.09.07.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:43:21 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:43:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Subject: Re: QCA: Add Bluetooth firmware for WCN7750 on Maili platform
Message-ID: <snasxsep4flqavgyy7cksr7byva7mhhpkfnvslij5crmlu3nv2@yva7f72k3yn2>
References: <cd7caef5-5d32-4751-a536-8a25ec3bd7f8@oss.qualcomm.com>
 <h3iqs33onqhedpwryihvha7nebtdccfrvnttzfusvrwjkof56w@7vfkegied45l>
 <ab9ec764-6f47-4219-98f4-7ba078500bc8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab9ec764-6f47-4219-98f4-7ba078500bc8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ea35c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=CIrlkRCjxrGhqhPyYQgA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: -YfEUCyqHKX-2D9miab-BOhFbqSWFGXS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyOSBTYWx0ZWRfXw2bw/45uDzbj
 QiTqvQXOe/qcNg58KiQFtvZwa3fpPo8LF9NDy2JIqxFGpLgefVXzFVS6iqY/OMFbjpQz3Zkbhog
 xsMFZS6+ihe8/rEfRErtN2/xgIQnhGY=
X-Proofpoint-GUID: -YfEUCyqHKX-2D9miab-BOhFbqSWFGXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyOSBTYWx0ZWRfXzlv0TDADOw5q
 uujV4VdzaxyPoY65fmBTSFk+47sYPkgtqEmL6av+U3UbiJRW17MH9JKvDImkNUzJ/Fi3eF2I3on
 CdiIVm7JEwOOHiL14PmBAXj5dKOjGEWno4b7YcaJlBFaZd4IV4TNWq73QI339qoXiAyyrt2UkJK
 Z8A7yhK+cXh3OuIaPPv9IIMW2Da8cLWOBBBeMhkNbHeI63zd8MDdKr4HXUI9oTLkqpFC0xm4PO4
 74iD50CoW7HIbnfb4QpqD6Yjt1atQUwemU2SxnR81g/RmF4886yLdyCT6DqsKjLBBcvYnCOvnL4
 582wFlo8FQgYcm6lP1CBrOsc9E8tEo7+ee5/jTMc1BpD+Ur6+K4iotOOpQxAySrOhgLt7vNzFru
 B62PLsZmVm8/+yQxnbeZu9xoaMYfg1ClZDart+3ABWHWNWNDLBqL9SzVemKibZ6NLPTwJQ9TUhP
 kbBvtPbojnDaGBXKo2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070129

On Mon, Sep 07, 2026 at 10:03:17AM +0800, Xiuzhuo Shang wrote:
> 
> 
> On 9/3/2026 7:55 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 03, 2026 at 06:37:03PM +0800, Xiuzhuo Shang wrote:
> >> Hi linux-firmware maintainers,
> >>  
> >> Here's a pull request for btfw. Please let me know if you have any problems.
> >>
> >> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> >>
> >>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/xiuzhuo-shang/qca_btfw.git main
> > 
> > Repo not found
> > 
> Sorry, the repo https://github.com/xiuzhuo-shang/qca_btfw.git was private, it is public now. Please help review again.>>

ERROR: Commit message check failed
  commit: 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c
  author: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
  QCA: Add Bluetooth firmware for WCN7750 on Maili platform
After correcting the issues below, force-push to the same branch.
This will re-trigger the CI.
---
1. Missing "Signed-off-by: author information"

> >> for you to fetch changes up to 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c:
> >>
> >>   QCA: Add Bluetooth firmware for WCN7750 on Maili platform (2026-09-03 18:28:54 +0800)

-- 
With best wishes
Dmitry
