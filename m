Return-Path: <SRS0=GJif=G7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B7CC79FA0
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 18:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DEA641F00A3D; Mon,  7 Sep 2026 18:34:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788806057;
	b=xAakpnkrot/iSwwxmQXCZ0yXXb6kcNNP+sgxOEudVRs8drVZOt4WIpJSLNxOY7F/6K2k
	 nIHLneeuu8Cam4ndGkJEDkcCifMaC4b2aeOt2EZVXQjrhNcxxOfplEJkpKENy0wP60JOA
	 r1jZlTYSfRrWBa3rjgbx2XJe3XIoakK+8XGVTVpfAxPLHrbOXciVeA3R+uTpsl5uLHmtH
	 XOepdePQ9xAkE3vIPPqjcgzzjTrrOe1yi0bciEJa0X+tBvszYwXzMhfIh1SLrxwkjjuUq
	 cwErZGspxIb1HR0RVVuwLGuXxak2au5QRIt0jS2IccyI/0NBPDoItiH+rssi42KmpNQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788806057;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2bBFN7CF+LiSowagROOfEE8dLAgAVSKucWFK+SzqeCk=;
	b=jZMygYUE/le5id2M4UsuLQSygdIEqpRP9RNjt94JNmBFOvVFW7aHHDHGs41BE1fsi8Xm
	 qJcOk83DQRR+1ArQRIssqfgAkjujP1yH/UfQxg7tKQbrfRa7NHKKnypTUuqvkWpZVkkxG
	 CWtkEqIvOvcWGRiDfxBifOk5KD6rDHM26dBM/DwonLDzuiwZbaapQ7iEk0E0ePZ+vrXny
	 hi/z6ZLiWlrz7x/gpP1QLc+4znOoFr9IJzLIDtIlr79wujNbT+hTW2zmdMPYj4k6/WYGd
	 kVQbZ20Qhr5Q3xhnbOyaE05vl/higNFNuIfBvmxMIFJTlJihm79LufZySmAqMNfYwHQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIgAatK9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iltIbmE7;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CF091F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 18:34:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIgAatK9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iltIbmE7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2CF091F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H8CT1838397
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 18:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2bBFN7CF+LiSowagROOfEE8d
	LAgAVSKucWFK+SzqeCk=; b=TIgAatK9CLiEMMdGfBrDuFzjRkGiGG6FMsyx7AtL
	6zMOrUgrHN/KaXOXb/ZFezzacSHcT1fsfBjHOLh/2Ig65hai9vvXP7qll2N0w5ja
	lk8CSl+igpNX12GdpgL+qcs7b0yNfTeCalwRF6CTlKISBIxiRvF9PDVZUxWbNf3w
	Vm34E/RI/FHY8CDq2xagAZaIZ7TKBRZnpedeZN7nB157ppHKSVlwSuNcYRT/bwpn
	BLfXeg/acI6CGq9DBQRxPtxR9CUW7y6psjAF7fVu8DLL/l7qXZcBIjIRq5129rlK
	u0yhzwzBHYECeB1argcGy59F5hhuLUx0jsiJiGf3pEzFRQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg28kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 18:34:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso52949565ad.1
        for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 11:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788806055; cv=none;
        d=google.com; s=arc-20260327;
        b=rHTJzycu7bZo/rXPFIpkioKCY3YlPSO7xqjK5qYKwgNX7C9KmUFrsfkxWE2QxfYyJd
         x11UxJv+g1SA8nZEziy9k71GVAk+qQamMvSgwu5KFO/vnMEOfw1DLoXBH+D6ICFbOzy6
         1wvXpCD8zR9q14Xhy3sLnUf7V6GUCHaQQp8ooQOYb3k63xQfx3hLPfjvSf1aa/U4vBGH
         Wf0eEEH8KMKuaauRGMmwyjPA5EXQydOntILCVuRrBIcu2POaH5/6JofwcJGqwfTKBuQk
         UxxEma5zFviVX8/C0aSJU4SZUIP3JxHzu9DmlDJe0QyfS37CzU1LzGJMgJaPyUWfPsJa
         OpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2bBFN7CF+LiSowagROOfEE8dLAgAVSKucWFK+SzqeCk=;
        fh=ZWrCnYBBlZwferzi2Vw1s+KRDQRenR54b2tSmW9IbAc=;
        b=si0Qb9t/8dPMTRdmgIrG4UJPtQuu/PVecHnKCfBlHXv0DWLbbtwlE5nkxJZ6p8EAK1
         9MbfJJ9rQmeuBWw+aUjjb73MZtqMV5hCoTqI3CFO7UrMj3q4i3M91y7qZ2pKgvGkMvCo
         /o+zars3eWtHdOK+RMsZ7BKcfpllQs6HLdqwv6uBRVS8/J1XfeCevBE89YGNJdmpmt63
         wXJ+vLP/6h/LSOsNTvWSRX/WHsMYJ9/h56xLQcWWwmR59TB93qh9Lw2kS4qFx2T3hg+R
         mA3ldgLtx+RxjVoZAIui8Ir1CGNw/vN90lmgGNkFjUWTbjPkinWQkNWpiPAYyeBUPC/8
         YGUg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788806055; x=1789410855; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bBFN7CF+LiSowagROOfEE8dLAgAVSKucWFK+SzqeCk=;
        b=iltIbmE7QLNgqjaJhHAxHeRUC9JGhKBQcEAE73vMw8DEveCQ41xDoBk8W6Jttu5LR1
         6jAGWL4qsDaJICMuJ2sJ6gVpMj9wom250hQD3zR/dAFhfiu7sw9ntFRr54tS6gDQ2w2I
         +wtilaw3BNHVc/efOzpHy2O3zErrq6SetcPcj4hRYoz9baALY2ErZTLwYceHhe0xRG3y
         D9NEeAYi584sboRq9gF734cT45EjG+bdpDfyxfLg+sYqqn6zfqiiZkFqHyJB1z71J25x
         iNzC7TZo+uX+JZDEvym5ErpV+ExeqPN5b5Mms+nUpVMSWNf3dR+xCNessGP9Oz7OIiI3
         01kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806055; x=1789410855;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2bBFN7CF+LiSowagROOfEE8dLAgAVSKucWFK+SzqeCk=;
        b=DLjAskk7DbZH8mOzFJ3xYl59pd1noHvVbeocyY2NR1Bad3jAQlVNVVOi6IWccZmNtU
         KEtY5XmcjHrArLOsDZoHv56C08o+fH2nZyNlIgvt6yVsFkyl4Dq2q5FhaOesl2bH4gc3
         wyIuIu/Tvq3nf0HK4AB/V9h0tltPGcFUiaV1f4F0JdLTJD5inyr/p5960QM9ZJfX1Y7L
         QDGnIQUNlvZD98g3Ps71GLlGRS21d0iZMoKhFfajKApHAX4cWcQZmrZ76TlB/Oba7JeX
         6SduzdPRAzGcemanzdqlUiWiSV6bztlkwXVNFXjtOgwrBzGJmmW3Ky9q9gct+2Trxpq+
         SFKQ==
X-Gm-Message-State: AFuF++n7nkb44F342v5s2hVSynzn26JBYaRhQuGy1rP1ybNBSg+er5De
	+bawrqyy2YPpMZwrVvY/V5QKfgcMHUxdnNPMNgTXs+VZOfcbSZkXrNrSbJBQkc9f13fLVs0xed8
	6ZRzouuU8asOVuC9lHWn3Gu5l06GHTxTxJcOELRxu+F5QT/JEKm5PaL4WK7ZHS5IVGjcv4AelVf
	2JF3xB7marGvXZjidkd1l8AG/sLC2u4w6ZhaJnug==
X-Gm-Gg: AYBFou2k/BNdkzTVnwtiyFfq1xNP5Cgp9bfkoVcHRE/gZtTF5D1+Uy5R+7BWuLEoaMi
	N9Vyexw7X0n/+BCxNs501sP8pi4R8PkKTtbQMbD7nc9wthd0FY+4xE3YyAcWZK3Yg/fGisrW12m
	jlSXUu4AHiZppiWbku6oAVwYznMkiEYQ6+fx0FOeRJQMCZJXcWVXdVIEabrgl200owG1u28b4Ee
	cULsJCc1zokxSmmaA==
X-Received: by 2002:a17:902:f092:b0:2d8:df44:a5c2 with SMTP id d9443c01a7336-2db126afe54mr264037155ad.20.1788806054826;
        Mon, 07 Sep 2026 11:34:14 -0700 (PDT)
X-Received: by 2002:a17:902:f092:b0:2d8:df44:a5c2 with SMTP id
 d9443c01a7336-2db126afe54mr264036775ad.20.1788806054296; Mon, 07 Sep 2026
 11:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <cd7caef5-5d32-4751-a536-8a25ec3bd7f8@oss.qualcomm.com>
 <h3iqs33onqhedpwryihvha7nebtdccfrvnttzfusvrwjkof56w@7vfkegied45l>
 <ab9ec764-6f47-4219-98f4-7ba078500bc8@oss.qualcomm.com> <snasxsep4flqavgyy7cksr7byva7mhhpkfnvslij5crmlu3nv2@yva7f72k3yn2>
 <9d9da832-45b6-42be-af8e-439c6b280744@oss.qualcomm.com>
In-Reply-To: <9d9da832-45b6-42be-af8e-439c6b280744@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 21:34:03 +0300
X-Gm-Features: AcwNN1XDCPCUZZODueTF6tbKhfcd7iqcIEhVK9FwCsevkb7vNW6uBEN_k1cVzY4
Message-ID: <CAO9ioeXPcci5cuvs9k-=J2zuAhSdT0RPVy6eT6-5NCFzqexQmQ@mail.gmail.com>
Subject: Re: QCA: Add Bluetooth firmware for WCN7750 on Maili platform
To: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIwNiBTYWx0ZWRfXxoUrEKUOwCla
 Svp88Jg+XhCXpNHHF1s2OR+gOoXBYgvSSDL1VwttETlD2WLCE+3+KWvYfKutaQdYFnUg+lCqHsd
 kOf6IPvb+F4mVIfvEX6u/+uhNz30A2VAIulYMI8NC2K2evIWfgi5aFE4hLMqLS4RbxYgxPS+sn6
 EYAB/Cj611PMO95rNBBdnZAQLbi9BZ9ioGtqYmEPzfS/+ZZrTvmP98lM8ww89Rcik7z4/kabExk
 OfiY/vqGkS1Xq12JBEB38JDIstX8xk2IEkZHYjP2IYQOINW7EKA1kmjX30mZjV8KSua37FWnus9
 oYaW9s5Ww4IXq+3+jYEHH9xBY8szd4rfTQTG2dlwE8a6+ZKM+DvhMjU6u9Fu+IYLdlSu6ihy3qV
 W162iXlQ3nWV3FEJVlqEAPAT6wVeSzTdO5hSMmtPtieyD8rn8NQgb47HQIgO8T7jU14gP/JEhwn
 +iuSALqgIyIq8Eg+Eyw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9f03a7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=cCqRt2vSgd-q0Wj8TTMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 2y5kYLBH_fW1DoeSBX4hYleDzv-eU0z9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIwNiBTYWx0ZWRfXwTpBZe2GKZWZ
 F6ad2nNdTXWfKQjUiN8hokzwzvZcnlik/+7wKCxjsiKICDlWptQgCxNaUjpJZeo4Pp/3JiMaIBL
 e6XPf522W8C2BY+6u4VZBtJhWWMvPcI=
X-Proofpoint-GUID: 2y5kYLBH_fW1DoeSBX4hYleDzv-eU0z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070206

On Mon, 7 Sept 2026 at 18:00, Xiuzhuo Shang
<xiuzhuo.shang@oss.qualcomm.com> wrote:
>
>
>
> On 9/7/2026 7:43 PM, Dmitry Baryshkov wrote:
> > On Mon, Sep 07, 2026 at 10:03:17AM +0800, Xiuzhuo Shang wrote:
> >>
> >>
> >> On 9/3/2026 7:55 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Sep 03, 2026 at 06:37:03PM +0800, Xiuzhuo Shang wrote:
> >>>> Hi linux-firmware maintainers,
> >>>>
> >>>> Here's a pull request for btfw. Please let me know if you have any problems.
> >>>>
> >>>> The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:
> >>>>
> >>>>   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   https://github.com/xiuzhuo-shang/qca_btfw.git main
> >>>
> >>> Repo not found
> >>>
> >> Sorry, the repo https://github.com/xiuzhuo-shang/qca_btfw.git was private, it is public now. Please help review again.>>
> >
> > ERROR: Commit message check failed
> >   commit: 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c
> >   author: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
> >   QCA: Add Bluetooth firmware for WCN7750 on Maili platform
> > After correcting the issues below, force-push to the same branch.
> > This will re-trigger the CI.
> > ---
> > 1. Missing "Signed-off-by: author information"
> >
> Commit message updated.

New PR please.

>>>> for you to fetch changes up to 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c:
> >>>>
> >>>>   QCA: Add Bluetooth firmware for WCN7750 on Maili platform (2026-09-03 18:28:54 +0800)
> >
>


-- 
With best wishes
Dmitry
