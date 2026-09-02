Return-Path: <SRS0=oSiP=G2=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F81EC61DD6
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 10:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E7C01F00A3A; Wed,  2 Sep 2026 10:28:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788344891;
	b=hI9Y/i8td1ODVYMjb7r774V8JIsAMDmfMOgTSs2WwaYaCmEkRjGyX19CNWRGGUhOg8X9
	 aVt9uxunB6cgovOSxiIMQbKSRvPZWdB9xj/HwRdxjEZZKW3On2E6tt+QXltoO039uWGJF
	 Ank3SHj2gEa5XXUPyYZOuR7+aSkjtvH6XPqmCT8zIQkubHWiimA4xzUbAw7emHGnLKxvQ
	 g/A3l648FbHu+eQ4lq57/prg0bl02xEELNwmrlJdI52burSjh23YDpcFC0vXJi9jrRHsG
	 69YrJpt+3YYJAespObl9V3wvJ5oCTpBQCKwRgdJGsJcMri87jHanI6aph6/kzmKsmiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788344891;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QK/5R/AQsKZLn7zLtufCkNE7eFKqA58lY9/nuEiaITE=;
	b=D3MnrQiyDfni5HCwDtK6G1nc6PKk94D40kc1rv0gTQJKOgcf5tHgdX6Qlczup5wCp43S
	 Lxg5ViVtt5Zu1uRuzzgv2AdrgfmueCyiATKEJ9YJm0V7kbujLYLXm8kc/Zuem12U7T0KT
	 HW7gSmXC8GdT8WJDEgS9uuiCYCqioCCzkGHi/tGwfivuPl1bVqT43YCESrYBE2oulWQqD
	 vFP7PUvGMTnn4M/kUSnQC83YGfjHKy6HaA428L5ul+1lnfRMs0TK9sSKuDy0jIp6ZnBoa
	 VXKI0RP7PnQpWQw7Ba/MjHwAK2+k1kXZSnty91LLsZhDEGg4QpxX0NsOJTypps+Np9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMH0Eu4x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmL9+2SV;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84CA71F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 10:28:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dMH0Eu4x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmL9+2SV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 84CA71F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NP5C1839253
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 10:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QK/5R/AQsKZLn7zLtufCkNE7eFKqA58lY9/nuEiaITE=; b=dMH0Eu4xPV1MRRGz
	dX0ourIv4AK62gY8ABx+UjkIO3EH4Ag86vn7aBjcO2YDYvUqKoZ26azViLk5xCqL
	hiCh4qTtXVZL4ZG8+4Zys3GR6Xz65fcEd4pBuXJT0LsiriqBV1Vt3LCtqmJ9cUJS
	48GP89aHJUf2LXFWw3/IkBRWZbdxycC4XCtJMWLyvNRC8/0pFWWzSSyHjNf5yRY4
	zHeJRnA/+MaQxzUqdlCNpr1ZaPP++7goWUEdNs3AtzUu1PuGLuzeCffYWnST54VX
	XHdJjC2NOCKpdzcyITe2MqcB5GGGXNcQnRqiNdSz9LlKpRgjaBsoLfMuih0+Dtrc
	LZunwg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx1gnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 10:28:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738627c7908so220101137.2
        for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 03:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344889; x=1788949689; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK/5R/AQsKZLn7zLtufCkNE7eFKqA58lY9/nuEiaITE=;
        b=WmL9+2SVKmFq40HCQJnXnF91Dk2VrSuVinYhjWjAChhRHmk6Gk8rUDOdvlxfbWWp9y
         mu0mK+2no5NuBe2yvsgpitbyOUOGDl+b26mHSFZ2RDKUW9yBlVmOzYM3t9Dkbzf4uliR
         VgXzEaWkiqIBwXVqUftNB/Qochm0AaGk4cdgkg3AegJ4UZxsMaJf6YlRlVfafY/tk9a7
         wFyjBQvpCLtfxFsZU5EG6EIEGqNjplNRtncXggfiCaRik5shRtmzXjs1SDLR30ShoZno
         Q31BFPVQ81hWb+oquCYwXihM0uJk3JmResH4nDKk1CCsfXV5impxM5YfTMR62p7wM5+e
         a4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344889; x=1788949689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QK/5R/AQsKZLn7zLtufCkNE7eFKqA58lY9/nuEiaITE=;
        b=iocKM6IHLQLbISEu84akcM6mjvqCprVzbrpnE7mCaXKVQIkRJ3aI/P87JHpQarE+BP
         nwZNTD5wha9t4o6JjPbL0DoV+jlXKpTvvn2nRWgzchQ5sok7uwx3/0lxBxeDpn0RoRDy
         79LGAOCqknE8zC1jauW6oD8Cr0RVst4rWG/rKQgsRM7PpexgnHfi3GAKV7h9ftuAbWek
         I2xDrOwuMu+pKaTxroJYyGyaU7eR3wkh9E9IN6NhfPhRJhnu8xqIIaOJ5wwURIjH5oqU
         UePRx56QsinDbsTreCp4+OOYZCyNpwLVbRfSdcWhUDpSZ7WywKdlSxmUSP+RMq2JHubf
         /wXw==
X-Gm-Message-State: AFuF++kP1d/O6u0vsJvtKkIbshF1aQ6Yq1+Wno9Fbb5vmTrDMuH2KNdg
	h9HMlRqxLe4DW7jhRdrCjQcP1/RVndEUxH17+04cYMcNhyQknMYbsb+fAt7iq9J8e6tB6jlCfx0
	mGDw21evbEiC41q59a67YnSRbvTGPKJni22bWW2XgjmUrxqcaW+Gezr9Osk1xcDiWPvmGmDI=
X-Gm-Gg: AYBFou1I3xCnkBYjxlibdXx0smH+ZpVaMJ5mwxo1EIqhkdiZXWsWpfTLrJ6TRiTpFSa
	7PLyW6GMqoSxrWk0sHE5hyVLFQ0afJgfLKYDOIsHRnceEGelQ43DyrYt8GqdYsvoLlr7xRXykht
	9fqel8m8d/NrLA1ZwEiSQ6bVagivN+j7EOuaC2eMHq8NKd2MikQzDe/H10W4xtIRqQTZtSiPTeJ
	J9VrHA0AKErzqAHQJTCj/XqxVpUOdOXGhOC+IsFeoiO/LX1NvjogulTrWSEQP8LWWLpzRgT87+J
	7EM9NlN0ig4bKzf0xUZTH3nWOjhGM5tjIbUnZwFW+/7ZAQnzJxroYJfNCtTxpiDUlDoXoDG5p2I
	sMDnU95LuXqzFfpp+JOuxqFmhOssIO540dgqRBpMClQS20xLY+t3qU45WHN0lFT5oDxBLPcRcnw
	DrTccsXC8PP5BS
X-Received: by 2002:a05:6102:510c:b0:784:b6e7:cee0 with SMTP id ada2fe7eead31-78a1f126196mr1089297137.3.1788344888632;
        Wed, 02 Sep 2026 03:28:08 -0700 (PDT)
X-Received: by 2002:a05:6102:510c:b0:784:b6e7:cee0 with SMTP id ada2fe7eead31-78a1f126196mr1089283137.3.1788344888175;
        Wed, 02 Sep 2026 03:28:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad21ef8sm5056461fa.28.2026.09.02.03.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:28:07 -0700 (PDT)
Date: Wed, 2 Sep 2026 13:28:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: QCA: Add Bluetooth firmware hmtnv20.b201/b202 for WCN7850 on
 Nord platform
Message-ID: <jgjbm7dqzcfn6rmmrhhro224nse6jmqc734qt7tekm6ghefrav@usxvljs4lqe6>
References: <182f576a-a9c2-4e21-b882-e04118c0c486@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <182f576a-a9c2-4e21-b882-e04118c0c486@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Cewo5v_ZOGRADIWoDLH3DtgiVs2gmvgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfX603BxOnzJ0Ps
 bbL/NU6YhiBW3ShOH7rloGJgs7Ujk0Pe0dPOgjR0PNeyTby5BDsqQ7UKprxJENSzqlWng4qfr2m
 b0kNaxrPfczS7677LhrKO4ps1uU32vkDd5cQkCmQkeP/DZeqYJhIu5kx3BVL28kKKgq4t8qd9pm
 jzPt9p91TcNs10C4k/eaiAZYt2A2nkr7MaqDXtLjG9aDnSTOb8fej0CXa7ukaYoyUW7Mtwv18+4
 OrTX89tCO47aukDgH1LYko7yaV0RYM/MhdkbcyA5vs2E7wwZActn07cT6QGCg3yvyS46t2+kPlN
 tl/940lXVKEBFWAKnOwSg42VvU1NfdCyg/Qitut1NqoTjg5vJl/8A/NIZ6I4JhudnG7BwWzpws9
 Zf5sr5C1+17Q2xDLTGnCAF+N/C+3VCGPkiZktM8xvlYWp7lX2ze1mF+IgZAvp0Fn8147ukZ1W8X
 qMb8iIDpiGzySN34drA==
X-Proofpoint-GUID: Cewo5v_ZOGRADIWoDLH3DtgiVs2gmvgk
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97fa39 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=HDlZJlEQXSmBd31KvFYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfXy7e/9uMrT4X7
 RATFL8XA/1rwvHQtztYr6OXXzzamx//3iRiqfye6DS/QOhCW847ui+mudkHRV6mklHwuztCIT2D
 fm70e/PBbZUjOMpRrRuB0DXCUG2Ttb8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

On Wed, Sep 02, 2026 at 03:52:35PM +0800, Shuai Zhang wrote:
> 
> for you to fetch changes up to 812a572e10d45accc48e4fb9325a5f10d15266ec:
> 
>   QCA: Add Bluetooth firmware hmtnv20.b201/b202 for WCN7850 on Nord platform
> (2026-09-02 15:43:23 +0800)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1212


-- 
With best wishes
Dmitry
