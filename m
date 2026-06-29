Return-Path: <SRS0=VsiK=EZ=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337D7C43458
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jun 2026 09:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B9611F00A3D; Mon, 29 Jun 2026 09:29:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782725353;
	b=3rjH4VmdgH1PkNXF65MjmVDMMHFdipsBOA08H6zpPu3TtMlHMcDmKiH7xFHhZxyaq7/h
	 ZBI5GNNWpJOrRAfi6Y+/qwyHl/ZIhTrI/CzPWFI3pAiTSM5na6QNfYNjuWjRTPQItlqwx
	 hRVJ24qRdye+LegXkKAD6rK8YcmINBhOqWrBAHvMHYjyyvXARSgfVDptyF0R1MkzP2MWO
	 ny+YEVuKjzG0o+gZcR+laf9jxg17uPCVgW8OZz1AzsXg23CSb60hM00wmOwk5z1OrQKwa
	 nReK6Z7p9VuQ663MK281ofi92kSl3BD3J8ebz9dzwiHE0oaSx6bPUfaEf/ylffcK45g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782725353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yF1Vg17b5dmurgx5wouYlMf7JN5SJtqloA1f1zq9dqs=;
	b=d0ZmK6VvcqP/7BnQHal/dePSGIqVvL3BDttmpmas4ZBABE2G3x+xUbp2IUZ67ojHza8T
	 8bSdrnPc1gNV5QRTcs8OE8ZhAWsOML21P0GV1NEKYJGSRdiS6uyLgcYgqb7Ufdca4kS8+
	 /YI2dY68FJP01gUis8t098NSyrbe/bEfHm0xIeXmLSybON4OAge/F//qUkv1gAj9oHgw7
	 piC5uVHW/b8qbKtASsmAIsDviH+V+JSR494KKhZfFx9CePi8mHyAZUX4sA+mgl4haCNoi
	 8WWJf9tm/4CmzdywkeCC4Wn3/gBU7BbrVi7Gns011M2DC3IdhAlFvXOW0941Q/WjYMQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMaGclEN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrkuVVoa;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F45C1F000E9
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 09:29:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMaGclEN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XrkuVVoa
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5F45C1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aRWb2368186
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 09:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yF1Vg17b5dmurgx5wouYlMf7
	JN5SJtqloA1f1zq9dqs=; b=cMaGclEN6nrZHxUAIX2wScdblzK8jD6hdQ0gE4HM
	V+Sy9W2LTJgIX/FvdQ73A4qvJEtJ4TYyeRTSFEIOwzq1TMrT1g31yqdIslHpnnrO
	LAwQ2y75v4mEtexLzyDoGwuUZdgqtyE68QZATxtCcmKmpmK0HI8k0YqsF+KjzT27
	Mx0myaoI5+jIIcNzzybXmltYD9BLkWbWwJYrLvveWCwjtdDQ3VULnDRhX6w2dq4n
	Jlq6+sZTaoDbi8A4nTYj6eN/9vrsPx5bmpn1L6nF2FPs3LrdaFk/Pr4RMTwKbiQn
	SxPE56rXzjiJ7HMnV9hjHySL7xHczBKsDxEMQSuShvBGcQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgr75t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 09:29:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a20348ceso28125335ad.1
        for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 02:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782725350; cv=none;
        d=google.com; s=arc-20260327;
        b=MNUNMz18wxsmaRNoqDbgHYMHYx6cAq75BJ2tOpvvv3SdI7LiRbr/b91u7WpRL3Vlml
         xmfuWgJ1ca+dJChHSUiyLJGsyzaPdGfr1Reqc+EOGbD683YXpiAsYkcO9ezzbChJ+ZYd
         dbk+4bn4OTkyaROpoh1n33uXAbQo7SXs7W7ACnZwgaJOJlGTflEsBWr+unE2rbhswNhD
         fEC3azELHucnKAH4lGlZ46lkwvW9kzoYxgFT1eeoaaP7FTH11ijhrm5L6Ylh0z8K8ceH
         NV/PM2Vpncmyr890YUeEvvk6AkfqAvV98ERGmdIeGQovI7Pe4EgqyNdigScu3Or8obLK
         QM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yF1Vg17b5dmurgx5wouYlMf7JN5SJtqloA1f1zq9dqs=;
        fh=DI8J/BHjMDuhRzEPEjswW5NfFn0bH0Ew4ktXw+mSeX0=;
        b=lT4HZwwEEMzRC3FR10wmatStYrhvt1FbOjaHIihDofRA3iDctU2ReycWa39p+LtbWw
         w4HCPpTqtHT2wf0g7hF43hKiXveZW85CcP17ZtgqXn41ajR1e5oXz5MutqWCOUe/XzAO
         ULCejxSB2GaEoaV9NBo4W1bIs7dE919YReBhpxJ/CSmb2laTzaavXCfTICRzHbtZMexY
         c1SVtACEHNCsMWKcwo8TsotdabGxM2ziEJ5Um9PUjGtLZiJAIKAzoy2LWNEDVN1ZQ2Sq
         stH0ZUMRve5x0MK1rBvtSZ/KC/wKOswWeINSk6NjO8z6C/jB+xZxlSF5p2EwXYX7yUd8
         qa2g==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782725350; x=1783330150; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yF1Vg17b5dmurgx5wouYlMf7JN5SJtqloA1f1zq9dqs=;
        b=XrkuVVoaHRjDEYjnmSj4dr1ACCQnavvXFj2oOjWyAdBIxgIY0EhBaKLbdEGam9VOQM
         q7fG7wBGUgipiuBORvdlOLrx2QmsYV9YiCuPp5NpdT8qyv4Tuab/WGZhj71AIHbsnWLV
         PEy5vm57G6DZsEBCxKbHt05JKxwjHx9OTzxahF3xSp+PJwK2KaJIZLvNTWD2POuGAwYJ
         RBbDTgS3WS2gFEu11FYOB1t/voORZtlCH/g0J2VC9CqvdQuOoQhvbhdSnY58kFjByzC6
         P2CeytHYKrHZBSAj4xthcpXkGCYsvDlPkLXn9AbLBWuTyMAuSIXy2ivK6al21cqpFgeO
         mceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782725350; x=1783330150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF1Vg17b5dmurgx5wouYlMf7JN5SJtqloA1f1zq9dqs=;
        b=EKmmEkmwfF4wHo+dXSQ5XkOg/3KbvnMxMRekcPj2RsFLYCBAPRPiwKqZQXW4va8JmB
         j7bpaikvdXUoUQpt1AiQ+MOtAmzyOLUmC8bpMbRAjXCfJ5poUp5eedlX1PrkfnKUoW0U
         kZi2Cm9rEhZPzXs85MLNvbhxNgyiGqIPjSHWM9qf5aW+Qp1icGcKAEGLpsJi3ZYQLuOX
         a2rha+f8bgRYxl1qXUOVKnKC8jm8tfJHICoHypZec7dkSYwS/vrkLz7z3jVXfcBX5uyX
         szTcaIVgz4dTsmCmo/3iryutP+lDzDTYTpxvcmBBLAtp+dGhaDwMz1+0IdYia0xHwoEI
         y/pg==
X-Gm-Message-State: AOJu0YwiJgWf5tSnH66auI+3mLO7auLqIWgxG/mImXU2sUUGslfVbWiW
	iVX2Xzw64UCguG5z1GRflXGmIEbMMzf8BrquejjvHugKe8YtC+MXHLnmjgupPx2sapKk4xdiXmN
	TbxJd6lXhWWKh67E3BrxF94UmVRhZapx6TNitWxXQu3nobtMzwaTC+Xsfh3pMRcEN5HTNGPOUuj
	ZKPfkJfY+UjYxFOMfhsI7RksdLN5qx76lj3m+Xbw==
X-Gm-Gg: AfdE7cnq2m9Ul/gAbxgNKGoa9kzUX6lbw9dBolnFyftcz89M9Yydhy/uYZ/1YPQ14PT
	aaGOz/UjVhtOtxLRzq06XvUQ0eVwAzUMVC46Pfp2uO5J4Klh9hBUopDcDmFmhmaUO0FCwQjuRfe
	5JnInMHXrUcjifgHC5Gti0MPxXOa0nIBUedNqGJyWPF1TQqOqlzd4scDxpDz8qqMCk6DtMmr7lJ
	UHmt2q2YSqrTQnTuHZ0Zzy61wpXSQ==
X-Received: by 2002:a17:902:ea0c:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2ca0eeaee8cmr13740425ad.18.1782725350315;
        Mon, 29 Jun 2026 02:29:10 -0700 (PDT)
X-Received: by 2002:a17:902:ea0c:b0:2ca:eea:eb5c with SMTP id
 d9443c01a7336-2ca0eeaee8cmr13740255ad.18.1782725349803; Mon, 29 Jun 2026
 02:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260629085830.3810576-1-wei.deng@oss.qualcomm.com>
In-Reply-To: <20260629085830.3810576-1-wei.deng@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:28:58 +0300
X-Gm-Features: AVVi8CfvwNx5SHKrfv05PF8zKOmSIdJrkmnoiceXCNUNLuGfnk5YrxyAI1IUz2Y
Message-ID: <CAO9ioeV0L54u-qajqDoBJw6tPvDUBKG6LhX8VhmmHFE=CbdnYg@mail.gmail.com>
Subject: Re: [GIT PULL] QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00072
To: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 684Ih3m6x3mBZb80w6nIs7xssCCE049D
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a423ae7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=SvUZfUsDFma65b0P2VoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NiBTYWx0ZWRfXzHIZt4KQufot
 gZAnGBIOCAMJxdIPyNJW0DBeHnc9pyTHa0lPVr/Wqd5T602Cs9oOcobbDOHQ0yh6PKJOUN64TvH
 RrTPtgE2eK6mRnW6DucbeZQ71SsTfwY=
X-Proofpoint-GUID: 684Ih3m6x3mBZb80w6nIs7xssCCE049D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NiBTYWx0ZWRfX/t8iSjlou8Lz
 n56w5ufiPxBH0Vh4DQlgnwDxBAyNuyejn99l+kXlr7iif8CFqYBys/MM8oCRlSsX2VDSODuaR+C
 RSj2zq/wZR0nzYElAhuj7Ff3CcDqyVAWxGNTC/nQKSDT74Pcgb+x44DsHeDtpIA34f0R5LrX64i
 4jdOtrtHK3fC9tC2RDsch/Ukg/k+zBoITcIy8+iqj0P3FdxGJWxHRP6pgtnNLCOnANvsHDOurnc
 3SennYI7ME/qUzkM80WMThK60kw80wIaKTYlTHCYNGm7WQ2mboNSLs2M+IiAjCIJcw9a2uCCQhD
 brKtRrVNf4K0MO3ulUqhFH5eYvapgOMLXyUzxk8LSqxj/kGypTgbUbLHIfE4fFxoHYaa1AmiJqi
 ZS3BMnARlEURt9yZqRud4/7JIj34mj4L9FPwgPrzs5ZkT2HQUzEzfBMgGafRIYWHp82tf4Zbv76
 QuK6x1QMa7kXVy/SxLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290076

On Mon, 29 Jun 2026 at 11:58, Wei Deng <wei.deng@oss.qualcomm.com> wrote:
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
>
>   https://github.com/WeiDeng-weiden/qca_btfw.git main
>
> for you to fetch changes up to 1d172a788a72fdbcd4e832bd248d64ddd0748e23:
>
>   QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00072 (2026-06-29 14:00:43 +0530)

Thanks, merged and pushed out:
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1128

In future, could you possibly write at least a minimal changelog to
help distributions to understand whether the update is important
enough to backport it or not.

-- 
With best wishes
Dmitry
