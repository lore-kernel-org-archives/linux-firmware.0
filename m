Return-Path: <SRS0=PR+f=GC=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04690C5AD4E
	for <linux-firmware@archiver.kernel.org>; Sun,  9 Aug 2026 23:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAB691F00A3D; Sun,  9 Aug 2026 23:29:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786318189;
	b=B9tm+ElJQW6V4NDVZ86tEL5ZqITq0n6WWgckWMKExyWdRvnSdo9MRSB2FJXaPV4CbbAj
	 M1JhHak04S5B70XTWZa5yAA0hRXxgPaL5/8Kgka4/zsW+edh5eG2Rm/GTi44AJPLFBaJM
	 iFf7RVj0qXZQTDtMiczohQub4uuvQ3xQBqoqFDftD2w//TORQzdzrUSDQngDRzfFnGtYQ
	 d3Keec73WOQNmP+t8ybAtWPKvwXRtPIbdqgi6i8IBgwSP2QRSYtKq27e0q6rquUmqu0SV
	 iA9GfvVRRMIIaSzmACGs60lrccWZJPkYQn4fIetKy/bHE0M0unSMVIYguyKRP2r2LgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786318189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
	b=Ek7q9KeKNfU+DfEKOw6yhH+sdphnnbsj3F0uJk7ajRseSJBMLkwuOGi8qMs75qY5lrlk
	 3hDlocdb0GZDYHsWuz5jQGo/PjQ6Immv8OkytQZe3rtXQJxIB4TkK89TTIbyKf867U/QP
	 TntGs+1XyCNqtifzaTkZ8B3lfVekhag8jmxGAw2YDXkaXAiXYaNuPFvvnlYmiLxe4AWXJ
	 Te+X+pgqDhk8Qp5YcV92efO5qeQxCPV5PZJPc+wbiSfTu+9PmD6ooYkN5+yKFSnXoUOwr
	 882q2KpYU30Ta+V7oNpQu3vro6gvJdT4CXrG0ATCoMRrh5CcCJw/5mBrKALexuxE+LA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pg3axF+H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2iyyKe+;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B3E61F000E9
	for <linux-firmware@kernel.org>; Sun,  9 Aug 2026 23:29:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pg3axF+H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2iyyKe+
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1B3E61F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679L7GOE3476731
	for <linux-firmware@kernel.org>; Sun, 9 Aug 2026 23:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MgifLTeWoPs7xR+NoGmw3cPD
	yJjBTZUCzAC0a9BDorI=; b=pg3axF+Hfg/EcnBJkRW7KwIiDyxAwk8LUfQjgKPP
	egMjGONOwsURlCbnafIb1A3SLZMngJxWpEly9lvrnFWRQwtAL02CDxQLDYETMmu0
	2LCKQrg8s+wq/+P6pDGQv7D8fGhk6/+IpgJm/omRqFID4jq9UKrHh2Scz+cvXfkn
	hlYjVdJ1yofirNpuz5DcNfekL5ICEe8AZ1uNsNgpTQbjNpw3jGvkxh+7ns2FAAGj
	aFBdQd8ph+Xa3niJiw8IlWlBrbXJOh+c1iKvkuXyMZIMwHeeXwxCOBg8WhkfTbYM
	ikXaJpf06Nx3MuZLuKzeWbPaROmi/XBUpLDjQzthBonGVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fww7cun5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 09 Aug 2026 23:29:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d28f8737eso26535841cf.2
        for <linux-firmware@kernel.org>; Sun, 09 Aug 2026 16:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786318187; x=1786922987; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
        b=J2iyyKe+LPbEpNA17EtQrDRC2ZGxYrLKJQcPccBO3TzKUKsbvAwyaOBn/lonSvXQpd
         2R3zl1H9mjaaoudqLWxpTyxv+Hd5GOEDaVM+0PttHM/kpPrbVd77yh0ooU9xjRFOafmV
         C0KCMEK+37354WHMJrQwN2ofNSQdYZwefUEKywI0Bc2dfQBmkKRmJtpVyaWZk4s1+Nq5
         Y1Ic8eSZiH6MH3Q2M4rh4YPywljg9SxZwMzX6ydaKvCIu1KEEGrpczHVWf/4o9FFdVSs
         5VAOVDhM1tP48+v76wdpGAejPSf1mfsl2eTZmVgn7ApdUBgAyc068PtqrYV4hYO875Ne
         joBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786318187; x=1786922987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgifLTeWoPs7xR+NoGmw3cPDyJjBTZUCzAC0a9BDorI=;
        b=rDtf9DfJyCJoJFS+l31Sw2rAqIGE2SBUCcNi8YfJ2NsEJFAg1ysluPzrhmqaxlUvbI
         rzXPOr+m/CyeFymSkK1Cb9i/exmnhZqXWmzY60VSyJXCOc4CMxB9kubAyD2Cvlg1djej
         RL46ctlCD55e720lCUJy8Qvm4iOtjGGgJGQOg9ogjf7vU7GNnMwYUmgvaRhpcWTUlrTc
         SRIuOeWyLS5keHm4IsRUMstdWpABgSR53RyVhyP2KJgt7dxSH1wEJxpNq9w+NIqiWzgc
         x+KlaCqUXbVGalOW23+yG/GtM/bHeBVV737lOCzFlHM5TwXCsrrX8RW7WDG8Z52k5l1q
         N9dg==
X-Gm-Message-State: AOJu0YwTaJFeHq+Lsax+TdxeIJ9n5TC0CSe3i6dbr0fphU3Ndaq+nI1W
	RaKXTSOU2/63qskIqS7pUZpXi4WkNCY5dEiSrFRqZLmMQqsFlxwuLF2TVzUTotB6IPGNIITn6Xf
	naSD7OLi6FyePNWnj4X4pFApWkEUzW5OlLizgbYyU8k0YEUEjPVyxwOpTa8m9Jng=
X-Gm-Gg: AR+sD13O+tf8g1bfpcTLXXOBRxkQHKnpqpIN7Q0N4i7efHIiRJu6t1M+6J+fxaaZzW1
	u/YYFdL/JJ7AX8RzfLvXsMT33d5M+eA9EKu5MidfKnnYdVnbDHzrflKdTORdfTmhQitItowDpi5
	ktmGABKgJxRa0Y3oa+ndMEHz6+gwVcOnhHRyxQcXozdxoVCZxq1N2bkeeTbTCRF6PkDVmO01EWo
	c0t1QkrSuNuKwWkKJKuuPOHlDGjeLNIRflOF0JdwgHHliTa9xIBRmB6QvGMooebNpXCMdIgSQSY
	2Bzc+6sQlqL28zzp5PKgyNFUwSlv0tf0hKzsNEoEFTw7YO+Mfss+xLplURpnG9cnKoYVOhms9R8
	7KE/OMUstacmQ9CIss95bUc3j5MrC5fDei14AS/9fAwWNVTXdAGkEg6PxFXdLuWTY8mWIpC098J
	tghKrSs+h0j4DI7A==
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr180714061cf.43.1786318187227;
        Sun, 09 Aug 2026 16:29:47 -0700 (PDT)
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr180713581cf.43.1786318186682;
        Sun, 09 Aug 2026 16:29:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050d011asm1631111e87.32.2026.08.09.16.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 16:29:44 -0700 (PDT)
Date: Mon, 10 Aug 2026 02:29:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260809
Message-ID: <fj7srjlprwhlbgjkk42uafcjysulte5lbw342tnultbhyijx4x@yxsgw6awrsnw>
References: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
X-Proofpoint-GUID: XP1ptyU25Uh9Y-jmDp9hN_IejqavQNJ6
X-Proofpoint-ORIG-GUID: XP1ptyU25Uh9Y-jmDp9hN_IejqavQNJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDIxMiBTYWx0ZWRfX9hJ4Djk+3kP9
 qCXcFITrl8EGvE/L+1tkyyJ2e/ulKGcqj1yFzqFxK8FtUgovQEBoePxsONUgeDkyegQRG4wzp6j
 iF9hfUvobqlfNCnNLKAXe245DfmyWknSnB869/BoNV50bTwqt+3wMjq6VhjCC7DGYNuohTZDaTl
 o3MqQSZyxBiAYcvPw4yhXAPnrn5KBIsYSY0RJLPnQzf2ZuLOhrrU45x561ORXj4YajC9cnVYVDE
 CeSXHAcQ6KCH9NeIeaW0OV0fN+O+/svSMnwa0vDvpjIRmiDfsB9/jm/pzaqWYh6L7aMXTiRcRga
 YIZlfeSY44rol8Ed6PlB13rztWi9M1reX5kGlQohL3QBBt0wa81A9Rw4np3TFGZCbK3E+rXlKFl
 o1ubAnIuaaojQVhHHUHDt7elJJc4nZjm60a6p/iWik7vaDBzFrofqIlCMJX+JSouGkMomJBsgTz
 2Ui+OkM3gWOi54wT0oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDIxMiBTYWx0ZWRfX3i83ypba3WJC
 ORfWPdA8xZQEmHn67nRJEDGusXO/WrvhRNrT8w4yKY78K2Hl1OG02S35UgScZkd+3aCPMJ7QRDj
 SCrdksuX9DN5L3r4R7K1OgJ6A8HeO6U=
X-Authority-Analysis: v=2.4 cv=IPsyzAvG c=1 sm=1 tr=0 ts=6a790d6c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=p0WdMEafAAAA:8
 a=Cll3ooqCA_IsHNaTrZ8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090212

On Sun, Aug 09, 2026 at 09:56:35AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath11k or ath12k.
> For ath10k, add board file for WCN3990 variant Shikra_EVK

Thanks! Merged and pushed out (for some reason it was ignored by robot):

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1171

For the future pull requests please consider including a change log in
the commit message (so they get recorded in the git history).

-- 
With best wishes
Dmitry
