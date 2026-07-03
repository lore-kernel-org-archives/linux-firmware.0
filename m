Return-Path: <SRS0=T9Jz=E5=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E22C43458
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Jul 2026 23:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7324B1F000E9; Fri,  3 Jul 2026 23:21:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1783120912;
	b=Ap7ONNCiknY6iIWcMMPmFbC6sTQfkEfU4XDbmM3EPa0R65EHnuN0JNy6Ofp+wXtRgJvQ
	 l3N54pHx66JG9wrdiZcoe6dNpBHUAc7bbQ0QgQLlYNk7owFay1EJTE+XbYDEQ/zDxBuSM
	 TFz5445QH5tB8U+rlJY5MHo5og5KQ3ue8HUN/wr+MZjxaMcGzXuWlBorc2SEslIMFem0j
	 NVRnrqY9PIFYoxO8Hp6MvBjhNBySDG+ZSjtcdDwWQZZfb34GOXMNcSgWFbwRpGX+LH3nt
	 mZMhZvKn2LgFOt07cFmiUA7UrZn7yXC77ZDn2jPvI6KLFH0IpU+6Ja23Zvh/EGknHtQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1783120912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YqeR9YFH+VoXg0Q7Cj4p3RouI1Jl1/oFxIpL5WIfTfo=;
	b=OQGP/aIZpMtx9P+/aTeMvwuY9K6orq1XfmeU+5cbRbFCcvrwS6MHAN+agJN68BpoJ7Di
	 Nz9oz++HPuWZFUpiUKJqQldemiwNYMoUI2IL8tfQQBGc1fI4TBPfpSKuuqEIVjp1oCV6V
	 zKcyxWGJWA9xkWBn0Lvq6PuP8WcAqd/xQLdwumOl7A9spgEO7u/dQM3aeeVhz5Zp3h9Zf
	 WPo6qEXDZ5NQaSUyNravOTXAjBObzDt7HiaBJUmr+k4Te/D8YoFQStsT0C5D7DXIzZ2md
	 lwTdEWfWpCvSCYhL8CqKqlSJNjZK4zoVx1oj903Nk07E5KVk+6735/Y2OaMZTuGj86g==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q9MXaoQY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2K6oBop;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4F1A1F00A3A
	for <linux-firmware@kernel.org>; Fri,  3 Jul 2026 23:21:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q9MXaoQY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2K6oBop
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C4F1A1F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPdZS1029449
	for <linux-firmware@kernel.org>; Fri, 3 Jul 2026 23:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YqeR9YFH+VoXg0Q7Cj4p3Rou
	I1Jl1/oFxIpL5WIfTfo=; b=Q9MXaoQYLbFuCgqk6xKzWMUlxSINwS6bkKZFQxxI
	+BOqqwWc86g93RSmPLGWsnOv6bMJWNIz9RccesFyJBk7OdxlAKUEev4kjiax4mdq
	bB0FPzmTlUFhx1ONNvQTpmvyXbLdsbsjxk/TLMPgz8C6MpCxSpe89a4571LqZa+U
	T+B+L96ZHHX1QoG3KQtQcpkWXUSyo3PDkCc3qIux8Ef8F/E2e/uw9w7ECiHgIGgf
	QHaY2o0YyxrHJAAEGqOD4J3bzZTrm3wTGFjgfW8T+8E+LDQD6xccRoueL4KLTVqX
	0Vwa4C/TcaY6sX3RfUATixW2tsDNgMWc+9T3yQeUlILRsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qckxqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Jul 2026 23:21:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c8018f11fbso10165045ad.3
        for <linux-firmware@kernel.org>; Fri, 03 Jul 2026 16:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783120910; cv=none;
        d=google.com; s=arc-20260327;
        b=g7FaX8oiLWZMRAxPgkZPMVOkIUVxR397GJdvKldeRCaOqaa08YzKvj7KEi0CsZKddF
         Ifekb3HIIhGsu2fdS1tWpaHQfyrQgkzRjqGErITqxb/kS4BkXhB0mX5igR6u0XkdipcX
         ex+gH46hNyniIqzE5TG+L1J+OReSl/Jdtn8RxBcP+7i1OQpzeKXlA6usofIrvomwUAXb
         0Wdmev2LpExjMjZTYKdTbe5UA0oS8yHpjCkhD6CG48gsTDlnFtstg8Xc65zbeCRdOWtY
         XjhL8SOj+YHMaob8XWHB85oOmm9sZmWXtnkJ1rO1wQMIK/SkuaoG8fM1yaf1WFwT4cxt
         he/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YqeR9YFH+VoXg0Q7Cj4p3RouI1Jl1/oFxIpL5WIfTfo=;
        fh=DI8J/BHjMDuhRzEPEjswW5NfFn0bH0Ew4ktXw+mSeX0=;
        b=k3l2pO7GL6NQ929jrLFX+j2zH0/Qh+ZXTu96mBy/IBAe0ZK1xIYHOl9YiyZrhXitw1
         0AVSxGK+AtN4naS4IB2nDa2EfxzXyqW1cPS1ovsmEkH6NM+Xa4uXSz3/6MnSg9SQFoS4
         SsULxOmqOA5pYlLbfqn8cS/+7EJ5vgmKoPzNA7aXpxSbXHdPLkQ0oZeIxfOISBBU8oRy
         3YBfOr2kPXL6HzTAqba1YofdHodAYVYbV+90UaUL5TvXhJ6py5zqUQTZbwRVABV+eiy5
         Mb/p+Dn6hhyJWsMrA/fFziDCpoq3sDcnmw6bnh8GsoeayHxEMhJfgXIhI2pzft3e4eqv
         vgng==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783120910; x=1783725710; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YqeR9YFH+VoXg0Q7Cj4p3RouI1Jl1/oFxIpL5WIfTfo=;
        b=e2K6oBopUS21P3LuUg1eNSc9b9FtNjjtAzRV/p3UD6BXmsbg6W5hCGb5qucqCM6J8/
         vFyMkDPUdlLskWkqnDMFliNia9Al/UNMmiqm8Pfc/rm6ddRLLrKz/cOW6u/Da/pM9OzI
         cJJx1VMwqgcnUYCtWsqi3Goy1qtNGUGFcZ1xcChGcVh7Lo/qC7xjPtmlRCUXTbUvM7l5
         jniWTJuLRb/cdX25gwoFE/Ezh8EtsgIFgwFrqrEisNNGMT3Xl5sL97goWrWoSddoXFnU
         w08eah7k7M/25elYAXNQli1jdddC1Z5Wp6XyW/lntRfEk6KvDIHAzZ/YYeXAENhcmgem
         Zrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783120910; x=1783725710;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YqeR9YFH+VoXg0Q7Cj4p3RouI1Jl1/oFxIpL5WIfTfo=;
        b=m0sTrZm5am6+xTHZJi7oIwZfreFgcg/ydTyuUW3lr/0xz9B+glYYTqPEdnOnDZaV1t
         UCOAcvXppNaIRy+Br0kM5FAJvIy47q7t4L9GzO74w7LMSHdS5rG6DNPQ4QpVofAOsCiR
         6Ks0W4UJsDGjdxjPtE1hBMaPtkj1Go5MEmimGLxgwxQiJzfzToeCGs3BeqZPKPj2J3mo
         mYP5zct1Hwa+NBXNI5uWFpzhL9HwsWkMJsKhuMjuD1gM9qgH4vilv8YFC/oo5m/bM7+p
         WEPWiMamPM/I8H3Br+fVCZ4URSezuNkjzweCZRgPuz7/bpmBIHJNLv+PKQ1THN7ECMBn
         hGRA==
X-Gm-Message-State: AOJu0Yy1LnKUozL/MxHwonkT6qX4S35A0srXQLzjAQkMAgj7xYqidn5P
	b/wKYMHIzSnOWiMwOKeeTriIeHI0daN/EMVUxYINEmzV2dmOAgmFY7zoNhpt6Zi7XDKEEW6cJ0r
	g+HTw1U3hepoNxy+dZKc05aZh8RKojOG93cKEarAip2UtyzvBqRD4RrmivB4wHZIuEGORIZPwmV
	7ZSBXYRN1ZIANE9QFmS3xoYNzmbk+0vXytMDpG1t6xHtiihQ==
X-Gm-Gg: AfdE7cmfLMpyuNOl2Me9uw1JpW2RQ74Q0vhoWRX/OF0qasDgWFyVGqA7pD3b/dmATe8
	DLBX1mU559qSu3dPI7oXL0tZRq2mD19TEb8hjGhebms1/TN/JeRTQRqW69H+8S6H5bYvi8LSEq/
	zNc0x5R/+uYCeUhGBSGgsJ0pdM/ysAPIFLwdLTCixubpnb6dJPraP8nP3j8hUrMtzalaQ=
X-Received: by 2002:a17:903:1acf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cbb9ed6187mr11209945ad.32.1783120909596;
        Fri, 03 Jul 2026 16:21:49 -0700 (PDT)
X-Received: by 2002:a17:903:1acf:b0:2ca:be8:62d with SMTP id
 d9443c01a7336-2cbb9ed6187mr11209735ad.32.1783120909042; Fri, 03 Jul 2026
 16:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260703063818.3129650-1-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260703063818.3129650-1-wei.deng@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 4 Jul 2026 02:21:38 +0300
X-Gm-Features: AVVi8CeiDTYu_1TtfUq6YveQ3mnh2DvK5BZKF9HCdB9j9Jop0iI2KzxWoEdlwLo
Message-ID: <CAO9ioeW=b2z9xXvy2=Qf2HsHTWnt8TfB8_JdoFC2zWzgVtgzjQ@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmware for WCN6855 ROM 1.0
To: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: q-ODQ7bVN81N8qxs6Fc5AHCumpdhgitU
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a48440e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=yc3C_AZbbpOKiCMGE7MA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: q-ODQ7bVN81N8qxs6Fc5AHCumpdhgitU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNiBTYWx0ZWRfX4ZlScxRrXT/o
 FbX7o/xcVeS1+o9oAaDn6Rhgoi90KhOBt3SSWSrXCQbv5vNY0oKlBgcFgi9F9B8WCGxKbqbGsZI
 gffhnJDAh5wwUfx931hAdEjTdV+E37h1h9YU+gTVESmiQ4MZUoJ3WmR0JKDwZN9YacTiO8P8xiD
 G3vy7vdvtO/IrkFbvSSdo5v+/rYJTtAIeAtAPITGjDwI0EPduKsd09meZZe9aEMA5Sf48Av6/sA
 zG7cosA9Par3KL1/Dt5oodTbG0bG8VOcv7v6ioVSrytZM5APik0RIkyZHn3yPIXTWT4hYAxa7D9
 z77FlCi2nLg9SnNWbvQbojEMn5jSdr4intAcUcOlUubsJutejBpAMSPglrKSTv/DCHN+v/pVxsv
 U5TiffHzF8rPfl3IS0V+630hmwyK5RlXIX2MU6aV6lKgTOlBDX9ogB5ut2R0HOl5MMQYrAnCFuj
 mfzVzsr0tNgWpBOWR0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNiBTYWx0ZWRfX545ESG2TpMIV
 6wjRet3mo+l7Ezb8Hoq9ISl9WEtvXAckWIq2tSfzVG8PEMTXonjRRN9uanI0b9vs/P2aCo9ffVy
 cSOz4X/wGWhVEvIrB9xaODsoGZEGiSg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030236

On Fri, 3 Jul 2026 at 09:38, Wei Deng <wei.deng@oss.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers,
>
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.

Thanks a lot! Merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1133




--
With best wishes
Dmitry
