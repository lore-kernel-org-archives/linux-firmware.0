Return-Path: <SRS0=isgf=F7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE669C55ABF
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Aug 2026 12:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94CBF1F000E9; Thu,  6 Aug 2026 12:08:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786018121;
	b=vO6SPa9fAfAQ9AEUgrrzA4Dsb4RiY4uT2mbCihpPmlGLa8gxZog1QzRgXBoYzCNEPIYB
	 oRN6bOpr929He5sG4+HheKd7dFhzLSyk1A9QTEHnOc6mZ5MASCePDi9tzzqo/bp8a4sKR
	 nPOSAB/LvQIQ85nxs2YWbs08VJndJvBl+xGTYY01+fkiymhhj5wETmqha1TvGUCqUnXgc
	 aV6V0cwpT71fouzvoS0yZEPZ2UaGYfDPnazpc0371T4NWYvYCAr3lhv+eDTjAsLPL2a33
	 leBb3SC5BOozX4hwwkm86oOiXy5DZfyagzS2mPoS7pVDantyTbrgNxoAeacBnzG83Og==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786018121;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VwpHTow0GXvAcxc33H3Y0/8BTZ3AwmulazAaVMLolnQ=;
	b=ksBOjG7cxjcDiAjSBFb9lL/aAJ3FwepuInwO9u9GkCvV0AoyL2N47AgH/l6IR60eQ5uo
	 51LphZxcprMM/K7o03aTrte6PhvIKURWJ0YEzOaShPA3f8Ml6Dsb7XcO1T6EOvY8W+bgn
	 ZzEtFgmBVsVhES9FUBfwsYd53+w/Uy37B9EXT1kjAE/J8vlDXrG1TdNfseu+ukVQis0Lv
	 PbDA5m403245KxCiPL+fZ5uRk3u+BNfHPkXO9F/j/wUB2WgjYU/z8LDIIgzOlJ3Cmbi3U
	 d3cDF4mbW4CJzuDHNU7QBNVd8a546mWPfe+Gzw/+hD8YSkc1MCb5F3NTJUhSP8i3L5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=px1EYx7h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F8EhGYdH;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCF511F00A3A
	for <linux-firmware@kernel.org>; Thu,  6 Aug 2026 12:08:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=px1EYx7h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F8EhGYdH
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DCF511F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769neh01876452
	for <linux-firmware@kernel.org>; Thu, 6 Aug 2026 12:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VwpHTow0GXvAcxc33H3Y0/8B
	TZ3AwmulazAaVMLolnQ=; b=px1EYx7hKwJviPzsIyRIUUw1hjELCRdynUoSYNVd
	lFt/DQtshw+FRYr+ugiKupe4oKobe63ycifGd4j1ywnRJjf3WjERkfvuvcgLrcCA
	ShCAAmRwYejLbG8ctzALujFm0qgB5j5jfV9LJUsLEkzzzy9avLX41D3XrdJyQHz3
	mBqwoGeQhTopMnUV1U5Hh0pico8m8MbUK9Iz5CBWX9tYdAUW21p48X9M6p7FtF14
	7kGR4+naXTFHGLsfYL7kflaeKBtAtw6XCyDCAvjAF7+16wkJ9lJGSInBMQBQicmi
	ZhfStSu1vewGWib+m7If0rXt+OsDUVr/io3iizn57BX4kg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjucj0jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 12:08:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f39a46efd9so6932196d6.1
        for <linux-firmware@kernel.org>; Thu, 06 Aug 2026 05:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018119; x=1786622919; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VwpHTow0GXvAcxc33H3Y0/8BTZ3AwmulazAaVMLolnQ=;
        b=F8EhGYdHcQOzmE1fkSv0sPl9tMajCeRP7dNAeb4tUCjfqYvr2ETGO2fSSnxF/WpAFJ
         OY2ONyATspyeXvKAzs+diGxycud3YIHWG1OB1XeIxKSWV5X2g8/kNYlpOhSD2eVS9uwq
         zuEKUb3KWCbsW6s09vfnAMhurYuUkYnZQOO2w/MmBVZFNaLiz3RtXLcT9J/HlvvsZ7Sy
         yS+8krF0NIZc4sbNlYNQLz+tAGj+OgER9BPQN6IuCrgsjPAisG4PFcBi90F6V8PiL0xj
         ZOeazST4oYLbZ+pnRov+yrWTEOR76EVn4YQtzRbKI3QS5PV1UAfS72OhhhEIYHgd0Y6u
         d20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018119; x=1786622919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwpHTow0GXvAcxc33H3Y0/8BTZ3AwmulazAaVMLolnQ=;
        b=I/AYpl9xAQyqHGU4zcl58UMIjrrRtoFvd3iZR9AkfzmBcvD+jow5ziI0yFZwWIrccp
         nlI1z+NVrvO/HESInRSySEeem6QrYck1ftKi4EHT2SM3rAccmzMbFE51wlYdlck4C33i
         hjly/U9WAqZfvk4hsHwN4iE8qTAe5OX7vtvTaNd+tzavV8QlcbELpTkvHoj7zmOU1mrb
         evKIGUz6sBmom/s0thmWWdWjeQAOwJej/T/ngJQM64qhiWgDhMfbaKv7I3mzHJYJWIBJ
         To/FkSdtVhaFtufgAcYoiWN7REzXFXlTHR9L1rfoekgSNh+4jO7DSVcMcs0q4FnCvQnW
         +bfw==
X-Forwarded-Encrypted: i=1; AHgh+RqNKxaoHAgewtb42OJhshAqhNc2r99V8ti0PfVeLyAfjrtJORoOY1+i/XaPGiRKjQVQ0iG20+BjWFKco9UFpA==@kernel.org
X-Gm-Message-State: AOJu0Ywnv1ZUCn5yEEq8GxHxbZnl+HaRz91oBi0CgdMJj3OMmXpG9PvU
	mekGBPN3q0vJDCMBxlJKqzpP3XqI9I7r7A7ftGEI9TjYsfzQ2NTrUIoeUrKkF7pbIRgyey0J/MT
	0zG/eGIjrv3nRv5O/r5AcuAt88Z8RqAZmkxc3VNtHLSn3rjzHLAvNnI4VDfBq1SWJ4BVtynA=
X-Gm-Gg: AR+sD10G9YDO/xyqU5w8N807R8qnFU+xBoZO67Ow6TOkdC1F49PV9/M/CN2+uWsJgWh
	DIxA+ddbidi61oW+kTBAoiC14GUkKwn/5uTc4aehYnih1If0n//La1/+nCxvtryoOFqTKgOkzy3
	gh2u0yMBrPm+PqzQoqBkSJE/PoOnUPiXf8m3o03S/u5ScZpcpv6a0E4JbiKJG2SybN2a9l8mkBT
	DXGfwPCvHeocFAgwgTtAKJmHBIRz2AynuiNelzlzthZEQjfXr/iKv8s5H2t0aOz2laWFY9UG/Nn
	PdRR5GB6XktzHFGQFuZ/gTujg0b12847vv6BtseBr6aa/EP/tMMTpYZ6qoHNUZ+WuPg2/gSSn+l
	HTrOZol2Dn1AOf0WYe6pOE464QEQbLuSnXhXQNjPSs6jIG1b3pNueIqEyYaJKRbp5akDpJLxTV1
	ZICYPdBNVAw3YhGQ==
X-Received: by 2002:a05:622a:598b:b0:528:38b1:b550 with SMTP id d75a77b69052e-52cfb04984bmr69620211cf.16.1786018118479;
        Thu, 06 Aug 2026 05:08:38 -0700 (PDT)
X-Received: by 2002:a05:622a:598b:b0:528:38b1:b550 with SMTP id d75a77b69052e-52cfb04984bmr69619361cf.16.1786018117980;
        Thu, 06 Aug 2026 05:08:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f623df54sm712338e87.26.2026.08.06.05.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:08:36 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:08:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: WeiTing Lee <weiting.lee@airoha.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, Lucien Jheng <lucien.jheng@airoha.com>,
        linux-mediatek@lists.infradead.org, Joseph Lin <Joseph.Lin@airoha.com>,
        Albert-AL Lee <albert-al.lee@airoha.com>, linux-firmware@kernel.org
Subject: Re: [PATCH] linux-firmware: Update firmware for an8811hb 2.5G
 ethernet phy
Message-ID: <ga66sufzlzldv5inu7zt6ubibyxlio4wzabnx7dbdsmfwbfhzd@4rjfjglfnruf>
References: <20260806110130.1393101-1-weiting.lee@airoha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806110130.1393101-1-weiting.lee@airoha.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfXzET03MB+QIfy
 cB0AKSVu/H4+Um69+exNjHtifUMDDJiAL1CYmvWjqZ8b0H+Ew16A/PMn3MNBIOCqI5W3L3+JoB1
 Q6yqJcOuAFQvqrZ0dGnk4iCbN4s7N7c=
X-Proofpoint-GUID: c3UaaLRTn04Hokg685TgxYiiD9SKP3jo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NSBTYWx0ZWRfX+T9y+BNBUd6Z
 +oDfFjfGgqfgz6QUX3RZHnpoi+a0hBh7fNFT7lckwG5HPyNMkFtYQ5vW9NjxS42bRXXloUeA1Ay
 BXQI2PYo+vsSloSiugRBX2BgvehbbA3MJRJFKLljGBQMDPPQ5TtV9AMJtKIaqlJYjmBnzWTwMwM
 LQMbpHfXgfDmbN0Z0QDA8+iKP3wPFJR+Y5JBhDgjd5OyL+ZqJ5gv18rwoJna0HU42EBBLR+VI+W
 yD14GN8VP1Dbl9vwHbUQOuo+YGqQuXCqKF36yJucwPM8eTPvhVuoyalYGIW0rJ3zBdOEMklVNP9
 A/lN/aaf2ml0gzJU7gzob+Q3YCGQYUb8iXT7pv6Ouk2sMsi6s47fO/tyTYlbYSNfR3iQ9h5u8St
 X3I7r3zZNJFVizO+q+uhRkFUQM31zK7aITbQQ92EDzgVCEYRXn8oFSDRVT529MCDov9nATuCSMg
 xaEqEuplqa739j/ZURQ==
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a747947 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=JGXwu8-eAAAA:8 a=J6nWL7tMu-auEnYDJm0A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=-p01NfQuWD51nzoNXB_L:22
X-Proofpoint-ORIG-GUID: c3UaaLRTn04Hokg685TgxYiiD9SKP3jo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060095

On Thu, Aug 06, 2026 at 07:01:26PM +0800, WeiTing Lee wrote:
> From: "weiting.lee" <weiting.lee@airoha.com>
> 
> Changes in this version:
> - Optimize power consumption for idle states.
> - Enhance 10M long reach performance for better signal coverage.
> - Optimize 2.5G training process to reduce connection time.
> Version: 26071602
> 
> Reviewed-by: Lucien Jheng <lucien.jheng@airoha.com>
> Signed-off-by: WeiTing Lee <weiting.lee@airoha.com>
> ---

It got missed by the robot, so I handled it manually. Thanks a lot for
your patience!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1170

-- 
With best wishes
Dmitry
